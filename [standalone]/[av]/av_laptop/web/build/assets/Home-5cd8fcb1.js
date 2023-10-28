import{c as m,b as S,u as j,s as M,y as q,a9 as P,r as y,j as e,e as l,D as A,T as C,F as o,A as g,f as d,am as T,B,L as H,m as O,an as J,ao as X}from"./index-eaf8ef63.js";import{T as Q}from"./Timer-dfa7f10b.js";import{G as L}from"./GetTrackType-d081291d.js";import{M as K}from"./ModalMenu-9d79a79d.js";import{A as p}from"./Accordion-de5db6cd.js";import{F as V}from"./Flex-7df226c6.js";import{B as w}from"./Badge-92851aa0.js";import{T as x}from"./Tooltip-205bb880.js";import{I as W}from"./IconUserPlus-82382ef6.js";import{I as Y}from"./IconTrash-44b73a37.js";import{T as Z}from"./Table-100d3887.js";import{G as _}from"./Group-b2299244.js";var ee=m("bell-off","IconBellOff",[["path",{d:"M9.346 5.353c.21 -.129 .428 -.246 .654 -.353a2 2 0 1 1 4 0a7 7 0 0 1 4 6v3m-1 3h-13a4 4 0 0 0 2 -3v-3a6.996 6.996 0 0 1 1.273 -3.707",key:"svg-0"}],["path",{d:"M9 17v1a3 3 0 0 0 6 0v-1",key:"svg-1"}],["path",{d:"M3 3l18 18",key:"svg-2"}]]),re=m("bell-ringing","IconBellRinging",[["path",{d:"M10 5a2 2 0 0 1 4 0a7 7 0 0 1 4 6v3a4 4 0 0 0 2 3h-16a4 4 0 0 0 2 -3v-3a7 7 0 0 1 4 -6",key:"svg-0"}],["path",{d:"M9 17v1a3 3 0 0 0 6 0v-1",key:"svg-1"}],["path",{d:"M21 6.727a11.05 11.05 0 0 0 -2.794 -3.727",key:"svg-2"}],["path",{d:"M3 6.727a11.05 11.05 0 0 1 2.792 -3.727",key:"svg-3"}]]),se=m("clock-play","IconClockPlay",[["path",{d:"M12 7v5l2 2",key:"svg-0"}],["path",{d:"M17 22l5 -3l-5 -3z",key:"svg-1"}],["path",{d:"M13.017 20.943a9 9 0 1 1 7.831 -7.292",key:"svg-2"}]]),ae=m("eye","IconEye",[["path",{d:"M10 12a2 2 0 1 0 4 0a2 2 0 0 0 -4 0",key:"svg-0"}],["path",{d:"M21 12c-2.4 4 -5.4 6 -9 6c-3.6 0 -6.6 -2 -9 -6c2.4 -4 5.4 -6 9 -6c3.6 0 6.6 2 9 6",key:"svg-1"}]]),te=m("ghost-off","IconGhostOff",[["path",{d:"M8.794 4.776a7 7 0 0 1 10.206 6.224v4m-.12 3.898a1.779 1.779 0 0 1 -2.98 .502a1.65 1.65 0 0 0 -2.6 0a1.65 1.65 0 0 1 -2.6 0a1.65 1.65 0 0 0 -2.6 0a1.78 1.78 0 0 1 -3.1 -1.4v-7c0 -1.683 .594 -3.227 1.583 -4.434",key:"svg-0"}],["path",{d:"M14 10h.01",key:"svg-1"}],["path",{d:"M10 14a3.5 3.5 0 0 0 4 0",key:"svg-2"}],["path",{d:"M3 3l18 18",key:"svg-3"}]]),ne=m("ghost","IconGhost",[["path",{d:"M5 11a7 7 0 0 1 14 0v7a1.78 1.78 0 0 1 -3.1 1.4a1.65 1.65 0 0 0 -2.6 0a1.65 1.65 0 0 1 -2.6 0a1.65 1.65 0 0 0 -2.6 0a1.78 1.78 0 0 1 -3.1 -1.4v-7",key:"svg-0"}],["path",{d:"M10 10l.01 0",key:"svg-1"}],["path",{d:"M14 10l.01 0",key:"svg-2"}],["path",{d:"M10 14a3.5 3.5 0 0 0 4 0",key:"svg-3"}]]),ie=m("map-pin-share","IconMapPinShare",[["path",{d:"M9 11a3 3 0 1 0 6 0a3 3 0 0 0 -6 0",key:"svg-0"}],["path",{d:"M12.02 21.485a1.996 1.996 0 0 1 -1.433 -.585l-4.244 -4.243a8 8 0 1 1 13.403 -3.651",key:"svg-1"}],["path",{d:"M16 22l5 -5",key:"svg-2"}],["path",{d:"M21 21.5v-4.5h-4.5",key:"svg-3"}]]),ce=m("user-x","IconUserX",[["path",{d:"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0",key:"svg-0"}],["path",{d:"M6 21v-2a4 4 0 0 1 4 -4h3.5",key:"svg-1"}],["path",{d:"M22 22l-5 -5",key:"svg-2"}],["path",{d:"M17 22l5 -5",key:"svg-3"}]]);const oe=({racers:n,identifier:t})=>!!n[t];const le=({events:n})=>{const t=S(),{lang:r}=j(M),{identifier:c,isOwner:h,isAdmin:b}=j(q),{settings:k,crew:v,tracksCategories:I}=j(P),[z,u]=y.useState(!1),[R,f]=y.useState({}),F=a=>{a.password?(f({title:r.racing.event_password,options:[{name:"password",icon:"fa-solid fa-key",title:r.racing.event_password,type:"password"}],button:r.racing.confirm_button,extraData:{event:"previewEvent",eventInfo:a,settings:k}}),u(!0)):d("av_racing","previewEvent",{eventInfo:a,settings:k})},D=a=>{a.password?(f({title:r.racing.event_password,options:[{name:"password",icon:"fa-solid fa-key",title:r.racing.event_password,type:"password"}],button:r.racing.confirm_button,extraData:{event:"setRoute",track:a}}),u(!0)):d("av_racing","setRoute",a)},E=a=>{a.password?(f({title:r.racing.join_event,options:[{name:"password",icon:"fa-solid fa-key",title:r.racing.event_password,type:"password"}],button:r.racing.confirm_button,extraData:{event:"joinRace",eventInfo:a,settings:k,crew:v}}),u(!0)):d("av_racing","joinRace",{eventInfo:a,settings:k,crew:v})},i=async a=>{if(u(!1),!!a)if(a.extraData.event=="startRace"){const s=await d("av_racing","startRace",{event:a.extraData.eventInfo});t(T(s))}else d("av_racing",a.extraData.event,a)},G=a=>{d("av_racing","quitRace",a)},N=async a=>{f({title:r.racing.start_race,options:[{name:"info",description:r.racing.event_warning,type:"info"}],button:r.racing.confirm_button,extraData:{event:"startRace",eventInfo:a}}),u(!0)},$=async a=>{const s=await d("av_racing","togglePhasing",a);t(T(s))},U=async a=>{const s=await d("av_racing","deleteRace",a);t(T(s))};return e.jsxs(l,{className:"events-container",p:5,children:[z&&e.jsx(K,{callback:i,data:R}),e.jsx(A,{mt:5}),e.jsx(l,{mt:10,children:e.jsx(C,{order:3,color:"gray.2",children:r.racing.upcoming_events})}),Object.keys(n).length>0?e.jsx(e.Fragment,{children:e.jsx(p,{mt:10,chevronPosition:"left",w:"100%",styles:()=>({content:{backgroundColor:"rgba(21, 27, 32, 0.65)",color:"white"},item:{color:"black",backgroundColor:"#CED4DA"},control:{color:"black",backgroundColor:"#CED4DA",":hover":{backgroundColor:"#E9ECEF"}}}),children:Object.entries(n).map(([a,s])=>e.jsx(e.Fragment,{children:L(s.type,I)?e.jsx(e.Fragment,{children:e.jsxs(p.Item,{value:s.identifier+a,id:s.identifier+a,children:[e.jsx(p.Control,{children:e.jsxs(V,{gap:"0px",justify:"flex-start",align:"center",direction:"row",wrap:"wrap",style:{display:"inline-flex",width:"100%",justifyContent:"space-between"},children:[e.jsxs(l,{style:{display:"inline-flex"},children:[e.jsx(o,{weight:500,children:s.title}),e.jsxs(l,{style:{display:"inline-flex"},ml:10,mt:4,children:[e.jsx(w,{color:"cyan.8",variant:"filled",size:"sm",children:`${r.racing.class}: ${s.class}`}),e.jsx(w,{color:"cyan.8",variant:"filled",size:"sm",ml:5,children:`${r.racing.event_buyin}: $${s.buyin}`}),e.jsx(w,{color:"cyan.8",variant:"filled",size:"sm",ml:5,children:`${r.racing.laps}: ${s.laps}`}),e.jsx(w,{color:"cyan.8",variant:"filled",size:"sm",ml:5,children:`${r.racing.event_racers}: ${s.numRacers}`}),e.jsx(w,{color:"cyan.8",variant:"filled",size:"sm",ml:5,children:`${s.type}`})]})]}),e.jsxs(l,{style:{display:"inline-flex"},children:[e.jsx(o,{weight:500,size:14,mr:5,children:`${r.racing.startsin}:`}),e.jsx(o,{size:14,children:s.started?e.jsx(e.Fragment,{children:e.jsx(o,{children:r.racing.started})}):e.jsx(e.Fragment,{children:e.jsx(Q,{deadline:s.seconds,expired:r.racing.started})})})]})]})}),e.jsx(p.Panel,{children:e.jsxs(l,{w:"100%",style:{display:"inline-flex",justifyContent:"space-between"},mt:5,children:[e.jsx(l,{children:s.description}),e.jsxs(l,{style:{display:"inline-flex",alignContent:"center",alignItems:"center"},children:[oe({racers:s.racers,identifier:c})?e.jsx(e.Fragment,{children:e.jsx(x,{label:r.racing.quit_event,color:"dark.4",children:e.jsx(g,{size:21,mr:5,onClick:()=>{G(s)},children:e.jsx(ce,{})})})}):e.jsx(e.Fragment,{children:!s.started&&e.jsxs(e.Fragment,{children:[e.jsx(x,{label:r.racing.join_event,color:"dark.4",children:e.jsx(g,{size:21,mr:5,onClick:()=>{E(s)},children:e.jsx(W,{})})}),e.jsx(x,{label:r.racing.preview,color:"dark.4",children:e.jsx(g,{size:21,mr:5,onClick:()=>{F(s)},children:e.jsx(ae,{})})}),e.jsx(x,{label:r.racing.set_route,color:"dark.4",children:e.jsx(g,{size:21,mr:5,onClick:()=>{D(s)},children:e.jsx(ie,{})})})]})}),c==s.host&&h||b?e.jsxs(e.Fragment,{children:[s.phasing?e.jsx(x,{label:r.racing.phasing_on,color:"dark.4",onClick:()=>{$(s.trackid)},children:e.jsx(g,{size:21,mr:5,children:e.jsx(ne,{})})}):e.jsx(x,{label:r.racing.phasing_off,color:"dark.4",onClick:()=>{$(s.trackid)},children:e.jsx(g,{size:21,mr:5,children:e.jsx(te,{})})}),!s.started&&e.jsx(x,{label:r.racing.start_race,color:"dark.4",children:e.jsx(g,{size:21,mr:5,onClick:()=>{N(s)},children:e.jsx(se,{})})})]}):null,c==s.host&&h||b?e.jsx(x,{label:r.racing.delete,color:"dark.4",children:e.jsx(g,{size:21,mr:5,onDoubleClick:()=>{U(s.trackid)},children:e.jsx(Y,{})})}):null]})]})})]},a)}):null}))})}):e.jsxs(e.Fragment,{children:[e.jsx(o,{size:12,ml:5,children:r.racing.no_events}),e.jsx(A,{mt:10})]})]})},de=({data:n})=>{const{lang:t}=j(M),r=n.map((c,h)=>e.jsxs("tr",{children:[e.jsx("td",{children:`# ${c.position}`}),e.jsx("td",{children:c.name}),e.jsx("td",{children:c.crew?e.jsx(e.Fragment,{children:c.crew.label}):e.jsx(e.Fragment,{children:" "})}),e.jsx("td",{children:c.vehicle}),e.jsx("td",{children:c.bestTime}),e.jsx("td",{children:c.time})]},h));return e.jsxs(Z,{children:[e.jsx("thead",{children:e.jsxs("tr",{children:[e.jsx("th",{children:t.racing.position}),e.jsx("th",{children:t.racing.racer}),e.jsx("th",{children:t.racing.crew}),e.jsx("th",{children:t.racing.vehicle}),e.jsx("th",{children:t.racing.best_lap}),e.jsx("th",{children:t.racing.total_time})]})}),e.jsx("tbody",{children:r})]})},he=({event:n})=>{const t=r=>{d("av_racing","underground",r)};return e.jsx(e.Fragment,{children:e.jsxs(p.Item,{value:n.trackid,id:n.trackid,children:[e.jsx(p.Control,{children:e.jsxs(_,{position:"center",grow:!0,ml:"1%",style:{display:"flex",alignItems:"center",alignContent:"center"},children:[e.jsx(o,{color:"dark.4",size:14,weight:500,truncate:!0,children:n.eventName}),e.jsx(o,{color:"dark.4",size:14,weight:500,truncate:!0,children:n.trackName}),e.jsx(o,{color:"dark.4",size:14,weight:500,truncate:!0,children:n.racers}),e.jsx(o,{color:"dark.4",size:14,weight:500,truncate:!0,style:{textTransform:"capitalize"},children:n.class}),e.jsx(o,{color:"dark.4",size:14,weight:500,truncate:!0,children:n.laps})]})}),e.jsxs(p.Panel,{children:[e.jsx(de,{data:n.results}),e.jsx(l,{style:{width:"100%",textAlign:"right"},mt:5,children:e.jsx(B,{size:"xs",color:"cyan.7",onClick:()=>{t(n)},children:"The Underground"})})]})]})})};const ge=({oldEvents:n})=>{const{lang:t}=j(M),{tracksCategories:r}=j(P);return e.jsx(e.Fragment,{children:Object.keys(n).length>0?e.jsx(e.Fragment,{children:e.jsxs(l,{className:"results-container",p:5,children:[e.jsx(l,{mt:10,children:e.jsx(C,{order:3,color:"gray.2",children:t.racing.today_result})}),e.jsxs(l,{style:{backgroundColor:"#CED4DA"},mt:10,children:[e.jsxs(_,{position:"center",grow:!0,w:"90%",style:{marginLeft:"auto",marginRight:"auto"},children:[e.jsx(o,{color:"dark.6",weight:500,truncate:!0,children:t.racing.event_name}),e.jsx(o,{color:"dark.6",weight:500,truncate:!0,children:t.racing.track_name}),e.jsx(o,{color:"dark.6",weight:500,truncate:!0,children:t.racing.racers}),e.jsx(o,{color:"dark.6",weight:500,truncate:!0,children:t.racing.class}),e.jsx(o,{color:"dark.6",weight:500,truncate:!0,children:t.racing.laps})]}),e.jsx(A,{}),e.jsx(p,{chevronPosition:"left",w:"100%",styles:()=>({content:{backgroundColor:"#2C2E33",color:"white"},item:{color:"black",backgroundColor:"#CED4DA"},control:{color:"black",backgroundColor:"#CED4DA",":hover":{backgroundColor:"#E9ECEF"}}}),children:n.map((c,h)=>e.jsx(e.Fragment,{children:L(c.type,r)?e.jsx(he,{event:c},h):null}))})]})]})}):e.jsx(e.Fragment,{})})};const _e=()=>{const n=S(),{events:t,oldEvents:r,notifications:c}=j(P),{lang:h}=j(M),[b,k]=y.useState(400),[v,I]=y.useState(!1),[z,u]=y.useState(""),[R,f]=y.useState("");y.useEffect(()=>{const D=async()=>{const i=await d("av_racing","getData");n(J({circuitPermission:i.createTracks,createRace:i.createRaces,deleteRace:i.deleteTracks,trackList:i.tracks,events:i.events,oldEvents:i.oldEvents,name:i.username,photo:i.photo,crew:i.crew,settings:i.settings,nationality:i.nationality,age:i.age,animationList:i.animationList,filterCategories:i.filterCategories,tracksCategories:i.tracksCategories,isCop:i.isCop,underground:i.underground})),u(i.topracer),f(i.toptrack),setTimeout(()=>{I(!1)},300)},E=window.innerHeight;k(E/1.85+50),D()},[]);const F=()=>{d("av_racing","notifications",!c),n(X(!c))};return e.jsx(e.Fragment,{children:v?e.jsx("div",{style:{position:"absolute",width:"100%",height:"100%"},children:e.jsx(H,{visible:v,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}):e.jsxs(l,{className:"racing-home-container",mah:b,children:[e.jsxs(_,{position:"center",spacing:"xl",grow:!0,style:{textAlign:"center"},children:[e.jsx(C,{order:3,color:"gray.2",children:h.racing.best_racer}),e.jsx(C,{order:3,color:"gray.2",children:h.racing.top_track})]}),e.jsxs(_,{position:"center",spacing:"xl",grow:!0,style:{textAlign:"center"},children:[e.jsx(o,{color:"gray.5",weight:500,italic:!0,size:18,children:z}),e.jsx(o,{color:"gray.5",weight:500,italic:!0,size:18,children:R})]}),e.jsx(le,{events:t}),e.jsx(ge,{oldEvents:r}),e.jsx("div",{style:{position:"absolute",zIndex:"200",bottom:O(45),right:O(12)},children:e.jsx(B,{leftIcon:c?e.jsx(e.Fragment,{children:e.jsx(re,{size:16})}):e.jsx(e.Fragment,{children:e.jsx(ee,{size:16})}),color:c?"cyan.8":"red.8",onClick:()=>{F()},children:c?"On":"Off"})})]})})};export{_e as default};
