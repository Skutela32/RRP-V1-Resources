import{n as g,o as v,r as d,a as S,R as O,e as P}from"./index-eaf8ef63.js";var x=g((a,{spacing:e,align:t,justify:r})=>({root:{display:"flex",flexDirection:"column",alignItems:t,justifyContent:r,gap:v({size:e,sizes:a.spacing})}}));const j=x;var w=Object.defineProperty,s=Object.getOwnPropertySymbols,l=Object.prototype.hasOwnProperty,o=Object.prototype.propertyIsEnumerable,n=(a,e,t)=>e in a?w(a,e,{enumerable:!0,configurable:!0,writable:!0,value:t}):a[e]=t,N=(a,e)=>{for(var t in e||(e={}))l.call(e,t)&&n(a,t,e[t]);if(s)for(var t of s(e))o.call(e,t)&&n(a,t,e[t]);return a},h=(a,e)=>{var t={};for(var r in a)l.call(a,r)&&e.indexOf(r)<0&&(t[r]=a[r]);if(a!=null&&s)for(var r of s(a))e.indexOf(r)<0&&o.call(a,r)&&(t[r]=a[r]);return t};const E={spacing:"md",align:"stretch",justify:"flex-start"},R=d.forwardRef((a,e)=>{const t=S("Stack",E,a),{spacing:r,className:i,align:f,justify:c,unstyled:p,variant:m}=t,y=h(t,["spacing","className","align","justify","unstyled","variant"]),{classes:u,cx:_}=j({spacing:r,align:f,justify:c},{name:"Stack",unstyled:p,variant:m});return O.createElement(P,N({className:_(u.root,i),ref:e},y))});R.displayName="@mantine/core/Stack";export{R as S};
