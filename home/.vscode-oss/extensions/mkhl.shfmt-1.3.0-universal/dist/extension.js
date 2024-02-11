"use strict";var S=Object.create;var m=Object.defineProperty;var _=Object.getOwnPropertyDescriptor;var O=Object.getOwnPropertyNames;var M=Object.getPrototypeOf,U=Object.prototype.hasOwnProperty;var V=(t,e)=>{for(var o in e)m(t,o,{get:e[o],enumerable:!0})},F=(t,e,o,n)=>{if(e&&typeof e=="object"||typeof e=="function")for(let r of O(e))!U.call(t,r)&&r!==o&&m(t,r,{get:()=>e[r],enumerable:!(n=_(e,r))||n.enumerable});return t};var f=(t,e,o)=>(o=t!=null?S(M(t)):{},F(e||!t||!t.__esModule?m(o,"default",{value:t,enumerable:!0}):o,t)),j=t=>F(m({},"__esModule",{value:!0}),t);var Y={};V(Y,{activate:()=>Q});module.exports=j(Y);var D=f(require("child_process")),i=f(require("vscode")),I=f(require("os")),u=require("vscode");var E=f(require("vscode")),P="shfmt";function q(){return E.default.workspace.getConfiguration(P)}var x=class{constructor(e,o){this.path=e;this.defaultValue=o}get(){return q().get(this.path)??this.defaultValue}async open(){return await E.default.commands.executeCommand("workbench.action.openSettings",`${P}.${this.path}`)}};function z(t){return Object.fromEntries(Object.entries(t).map(([e,o])=>[e,new x(e,o)]))}var l=z({executablePath:"shfmt",executableArgs:[],formatIgnored:!1});var A=f(require("vscode")),G="editorconfig.editorconfig";function W(){return A.default.extensions.getExtension(G)?.exports}async function N(t){return await W()?.resolveCoreConfig(t)??{}}var H=new u.Range(0,0,Number.MAX_SAFE_INTEGER,Number.MAX_SAFE_INTEGER),L=/^.+:(\d+):(\d+): (.+)/g,B=i.default.Uri.parse("https://github.com/mvdan/sh#shfmt"),b=class{constructor(e){this.diagnostics=e}resolveVariables(e,o){let n=new Map,r=I.default.homedir()||process.env.USERPROFILE;r&&n.set("${userHome}",r);let g=o.uri;if(g){let s=i.default.workspace.getWorkspaceFolder(g);s&&n.set("${workspaceFolder}",s.uri.fsPath)}return i.default.workspace.workspaceFolders?.forEach(s=>{n.set(`\${workspaceFolder:${s.name}}`,s.uri.fsPath)}),e.map(s=>{for(let[h,a]of n)s=s.replace(h,a);return s})}async provideDocumentFormattingEdits(e,o,n){let r=await this.shfmtArgs(e,o);if(r===null)return;let g=i.default.workspace.workspaceFolders?.[0].uri.path??process.cwd(),[s,...h]=this.resolveVariables([l.executablePath.get(),...l.executableArgs.get()],e),a=D.default.spawn(s,[...h,...r],{cwd:g});n.onCancellationRequested(()=>a.kill());let T=e.validateRange(H),$=e.getText(T);a.stdin.end($);let y="",w="";a.stdout.on("data",c=>y+=c),a.stderr.on("data",c=>w+=c);try{let c=await new Promise((C,v)=>{a.on("error",d=>v(d)),a.on("close",d=>C(d))});if(n.isCancellationRequested)return;if(this.diagnostics.delete(e.uri),c===0)return[u.TextEdit.replace(T,y)];let p=[...w.matchAll(L)].map(([C,v,d,R])=>{let k=new u.Position(parseInt(v)-1,parseInt(d)-1);return new i.default.Diagnostic(new u.Range(k,k),R)});throw this.diagnostics.set(e.uri,p),w}catch(c){if(J(c,s)){await this.shfmtNotFound(s);return}let p=K(c);p!==void 0&&await i.default.window.showErrorMessage(`shfmt error: ${p}`);return}}async shfmtArgs(e,o){let n=await N(e);if(n.ignore&&!l.formatIgnored.get())return null;let r=[];return e.isUntitled||r.push(`-filename=${e.uri.fsPath}`),"indent_style"in n||"indent_size"in n||r.push(`-i=${o.insertSpaces?o.tabSize:0}`),r}async shfmtNotFound(e){let o=["Install","Configure"],n=await i.default.window.showErrorMessage(`shfmt error: ${e}: command not found`,...o);n==="Install"&&await i.default.env.openExternal(B),n==="Configure"&&await l.executablePath.open()}};function J(t,e){return!(t instanceof Error)||!("path"in t)||!("code"in t)?!1:t.path===e&&t.code==="ENOENT"}function K(t){if(typeof t=="string")return t;if(t instanceof Error)return t.message;console.error("unhandled error",t)}function Q(t){let e=i.default.languages.createDiagnosticCollection("shfmt"),o=new b(e),n={language:"shellscript"};t.subscriptions.push(e,i.default.languages.registerDocumentFormattingEditProvider(n,o))}0&&(module.exports={activate});
