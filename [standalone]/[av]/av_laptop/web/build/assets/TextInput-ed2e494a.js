import{r as c,R as n,w as s}from"./index-eaf8ef63.js";import{u as m}from"./use-input-props-f4b3fc79.js";var u=Object.defineProperty,v=Object.defineProperties,O=Object.getOwnPropertyDescriptors,p=Object.getOwnPropertySymbols,i=Object.prototype.hasOwnProperty,_=Object.prototype.propertyIsEnumerable,f=(r,e,t)=>e in r?u(r,e,{enumerable:!0,configurable:!0,writable:!0,value:t}):r[e]=t,o=(r,e)=>{for(var t in e||(e={}))i.call(e,t)&&f(r,t,e[t]);if(p)for(var t of p(e))_.call(e,t)&&f(r,t,e[t]);return r},d=(r,e)=>v(r,O(e)),w=(r,e)=>{var t={};for(var a in r)i.call(r,a)&&e.indexOf(a)<0&&(t[a]=r[a]);if(r!=null&&p)for(var a of p(r))e.indexOf(a)<0&&_.call(r,a)&&(t[a]=r[a]);return t};const y={type:"text",size:"sm",__staticSelector:"TextInput"},x=c.forwardRef((r,e)=>{const t=m("TextInput",y,r),{inputProps:a,wrapperProps:l}=t,P=w(t,["inputProps","wrapperProps"]);return n.createElement(s.Wrapper,o({},l),n.createElement(s,d(o(o({},a),P),{ref:e})))});x.displayName="@mantine/core/TextInput";export{x as T};
