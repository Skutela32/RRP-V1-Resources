import{c as C,r as n,u as h,s as M,M as F,j as e,L as I,J as S,F as o,A as l,f as g}from"./index-eaf8ef63.js";import{T as W}from"./Timer-dfa7f10b.js";import{M as A}from"./ModalMenu-9d79a79d.js";import{G as m}from"./Grid-cdc18556.js";import{F as d}from"./Flex-7df226c6.js";import{T as a}from"./Tooltip-205bb880.js";import{I as D}from"./IconFlame-49589d0a.js";import{I as L}from"./Boosting-abb9e5d6.js";import{I as P}from"./IconTrash-44b73a37.js";var $=C("send","IconSend",[["path",{d:"M10 14l11 -11",key:"svg-0"}],["path",{d:"M21 3l-6.5 18a.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a.55 .55 0 0 1 0 -1l18 -6.5",key:"svg-1"}]]);const H=()=>{const[p,u]=n.useState(!0),{lang:s}=h(M),{contracts:x,name:b}=h(F),[i,f]=n.useState(!1),[j,c]=n.useState({}),[y,r]=n.useState(!1);n.useEffect(()=>{window.innerWidth<=1300&&f(!0),setTimeout(()=>{u(!1)},250)},[]);const w=t=>{c({title:s.boosting.start_contract,options:[{type:"info",description:`${s.boosting.start_heading} ${t.priceVin} ${s.boosting.crypto}.`,style:{textAlign:"center",fontWeight:"500",marginTop:"10px"}},{name:"mode",type:"select",title:s.boosting.delivery_type,default:"normal",options:[{value:"normal",label:s.boosting.normal_button},{value:"vin",label:s.boosting.vin_button}],style:{marginTop:"5px"}}],button:s.boosting.confirm_button,extraData:{event:"start",contract:t}}),r(!0)},v=t=>{g("av_boosting","delete",t)},_=t=>{c({title:s.boosting.transfer,options:[{name:"target",icon:"fa-solid fa-user",title:s.boosting.transfer_contract,type:"number",asterisk:!0}],button:s.boosting.confirm_button,extraData:{event:"transfer",contract:t}}),r(!0)},T=t=>{c({title:s.boosting.auction_menu,options:[{name:"bid",icon:"fa-solid fa-hand-holding-dollar",title:s.boosting.min_bid,type:"number",asterisk:!0}],button:s.boosting.confirm_button,extraData:{event:"auction",contract:t,name:b}}),r(!0)},k=t=>{r(!1),t!=null&&t.extraData&&g("av_boosting",t==null?void 0:t.extraData.event,t)};return e.jsxs(e.Fragment,{children:[y&&e.jsx(A,{callback:k,data:j}),p?e.jsx("div",{style:{position:"relative",width:"100%",height:"100%"},children:e.jsx(I,{visible:p,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}):e.jsx(e.Fragment,{children:x[0]?e.jsx(m,{gutter:"sm",style:{marginTop:"5px"},children:x.map((t,z)=>e.jsx(m.Col,{className:"boosting-contract",children:e.jsxs(d,{justify:"center",align:"center",direction:"row",wrap:"nowrap",sx:{justifyContent:"space-between"},children:[e.jsxs("span",{style:{display:"inline-flex"},children:[e.jsx(S,{style:{marginTop:"2px",backgroundColor:"rgba(10,10,10,1)",border:"solid 2px",borderColor:t.started?"#20C997":"#7950F2",marginLeft:i?"0px":"5px"},radius:100,size:i?40:45,children:t.class}),e.jsxs(d,{justify:"flex-start",align:"flex-start",direction:"column",wrap:"wrap",style:{marginLeft:"15px"},children:[e.jsxs(o,{weight:500,size:i?14:16,children:["Vehicle: ",e.jsx("a",{style:{fontWeight:"400",textTransform:"capitalize"},children:t.label})]}),e.jsxs(o,{weight:500,size:i?14:16,children:["Plates: ",e.jsx("a",{style:{fontWeight:"400",textTransform:"capitalize"},children:t.plates})]})]})]}),e.jsx(d,{justify:"flex-start",align:"flex-start",direction:"column",wrap:"wrap",children:t.started?e.jsx(o,{style:{marginRight:t.started?"100px":"0px"},children:s.boosting.contract_started}):e.jsxs(e.Fragment,{children:[e.jsxs(o,{weight:500,size:i?14:16,style:{display:"inline-flex"},children:[`${s.boosting.expires}: `,e.jsx("a",{style:{fontWeight:"400"},children:e.jsx(W,{deadline:t.seconds,expired:s.boosting.expired})})]}),e.jsxs(o,{weight:500,size:i?14:16,children:["Price: ",e.jsx("a",{style:{fontWeight:"400"},children:`${t.price} ${s.boosting.crypto}`})]})]})}),e.jsxs("span",{style:{display:"inline-flex"},children:[!t.started&&e.jsxs(e.Fragment,{children:[e.jsx(a,{label:s.boosting.start_button,position:"top",withinPortal:!0,color:"dark.3",children:e.jsx(l,{onClick:()=>{w(t)},children:e.jsx(D,{size:20})})}),e.jsx(a,{label:s.boosting.transfer_button,position:"top",withinPortal:!0,color:"dark.3",children:e.jsx(l,{onClick:()=>{_(t)},children:e.jsx($,{size:17})})}),!t.auctioned&&e.jsx(a,{label:s.boosting.auction_button,position:"top",withinPortal:!0,color:"dark.3",children:e.jsx(l,{onClick:()=>{T(t)},children:e.jsx(L,{size:17})})})]}),e.jsx(a,{label:s.boosting.delete_button,position:"top",withinPortal:!0,color:"dark.3",children:e.jsx(l,{onClick:()=>{v(t)},children:e.jsx(P,{size:19})})})]})]})},z))}):e.jsx("div",{className:"profile-container",children:e.jsx(o,{size:16,weight:600,children:s.boosting.no_contracts})})})]})};export{H as default};
