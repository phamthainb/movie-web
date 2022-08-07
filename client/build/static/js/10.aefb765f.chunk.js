(this["webpackJsonpmy-app"]=this["webpackJsonpmy-app"]||[]).push([[10],{127:function(e,c,t){"use strict";var n=t(120),a=t(121),s=t(122),i=t(124),o=t(0),r=t.n(o),l=t(1),d=function(e){Object(s.a)(t,e);var c=Object(i.a)(t);function t(e){var a;return Object(n.a)(this,t),(a=c.call(this,e)).state={hasError:!1},a}return Object(a.a)(t,[{key:"componentDidCatch",value:function(e,c){console.log("Error Boundry",e,c)}},{key:"render",value:function(){return this.state.hasError?Object(l.jsx)("span",{style:{color:"red"},children:"Error Boundry"}):this.props.children}}],[{key:"getDerivedStateFromError",value:function(e){return console.log("Error Boundry",e),{hasError:!0}}}]),t}(r.a.Component);c.a=d},129:function(e,c,t){"use strict";var n=t(0),a=t.n(n),s=t(14);c.a=function(e,c){var t=Object(s.d)(),n=a.a.useRef(!1);n.current||(t.injectReducer(e,c),n.current=!0)}},135:function(e,c,t){"use strict";t.d(c,"b",(function(){return n})),t.d(c,"a",(function(){return a}));var n=function(e){return e?"".concat("https://api.web-movies.top","/").concat(e):"/img/images.jpeg"};var a=function(e){return function(e){for(var c in e)null!==e[c]&&void 0!==e[c]&&""!==e[c]||delete e[c];return e}(e)}},137:function(e,c,t){"use strict";t.d(c,"a",(function(){return N}));var n=t(12),a=t(37);var s,i=t(0),o=t(11),r=t(1);function l(e){Object(a.a)(e);var c={triggerScrollTop:function(){try{window.scroll({top:0,left:0,behavior:"smooth"})}catch(e){window.scrollTo(0,0)}}}.triggerScrollTop;return Object(r.jsx)(j,{children:Object(r.jsx)("footer",{className:"footer",children:Object(r.jsx)("div",{className:"container",children:Object(r.jsx)("div",{className:"row",children:Object(r.jsx)("div",{className:"col-12",children:Object(r.jsxs)("div",{className:"footer__content",children:[Object(r.jsx)("a",{href:"index.html",className:"footer__logo",children:Object(r.jsx)("img",{src:"img/logo.svg",alt:""})}),Object(r.jsxs)("span",{className:"footer__copyright",children:["\xa9 2020 HotFlix",Object(r.jsx)("br",{})," Create by"," ",Object(r.jsx)("a",{href:"https://themeforest.net/user/dmitryvolkov/portfolio",target:"_blank",rel:"noreferrer",children:"Dmitry Volkov"})]}),Object(r.jsxs)("nav",{className:"footer__nav",children:[Object(r.jsx)("a",{href:"about.html",children:"About Us"}),Object(r.jsx)("a",{href:"contacts.html",children:"Contacts"}),Object(r.jsx)("a",{href:"privacy.html",children:"Privacy Policy"})]}),Object(r.jsx)("button",{className:"footer__back",type:"button",onClick:function(e){e.preventDefault(),c()},children:Object(r.jsx)("i",{className:"icon ion-ios-arrow-round-up"})})]})})})})})})}var d,j=o.c.div(s||(s=Object(n.a)([""]))),b=Object(i.memo)(l),m=t(35),h=t(36),u=t(15),O=t(22),v=t(14),x=t(3),f=t(38);function _(e){Object(a.a)(e);var c=Object(v.c)(O.a).user,t=Object(v.b)(),n=Object(x.f)();return Object(i.useEffect)((function(){localStorage.getItem("token")&&Object(m.d)({method:"GET",url:h.a.USER.Me}).then((function(e){t(Object(u.b)(e.data))}))}),[]),Object(r.jsx)(g,{children:Object(r.jsx)("header",{className:"header",children:Object(r.jsx)("div",{className:"container",children:Object(r.jsx)("div",{className:"row",children:Object(r.jsx)("div",{className:"col-12",children:Object(r.jsxs)("div",{className:"header__content",children:[Object(r.jsx)(f.b,{to:"/",className:"header__logo",children:Object(r.jsx)("img",{src:"/img/logo.svg",alt:""})}),Object(r.jsxs)("ul",{className:"header__nav",children:[Object(r.jsx)("li",{className:"header__nav-item",children:Object(r.jsx)(f.b,{className:"dropdown-toggle header__nav-link",to:"/",children:"Home"})}),Object(r.jsx)("li",{className:"header__nav-item",children:Object(r.jsx)(f.b,{to:"/help",className:"header__nav-link",children:"Help"})})]}),Object(r.jsxs)("div",{className:"header__auth",children:[Object(r.jsx)(f.b,{to:"/search",className:"header__search",children:Object(r.jsx)("button",{className:"header__search-button",type:"button",children:Object(r.jsx)("i",{className:"icon ion-ios-search"})})}),Object(r.jsx)("div",{className:"dropdown header__lang",children:Object(r.jsx)("a",{className:"dropdown-toggle header__nav-link",href:"#",children:"EN"})}),(null===c||void 0===c?void 0:c.id)?Object(r.jsxs)(r.Fragment,{children:[Object(r.jsx)("a",{href:"#",className:"header__sign-in",children:Object(r.jsxs)("span",{children:[null===c||void 0===c?void 0:c.username.slice(0,10),"..."]})}),Object(r.jsx)("a",{href:"#",className:"header__sign-in",onClick:function(e){e.preventDefault(),localStorage.clear(),n.push("/signin")},children:Object(r.jsx)("span",{children:"Logout"})})]}):Object(r.jsx)(f.b,{to:"/signin",className:"header__sign-in",children:Object(r.jsx)("span",{children:"sign in"})})]})]})})})})})})}var g=o.c.div(d||(d=Object(n.a)([""]))),p=Object(i.memo)(_);function N(e){var c=e.children;return Object(r.jsxs)(r.Fragment,{children:[Object(r.jsx)(p,{}),Object(r.jsx)(r.Fragment,{children:c}),Object(r.jsx)(b,{})]})}},222:function(e,c,t){"use strict";t.r(c);var n=t(37),a=t(35),s=t(36),i=t(127),o=t(137),r=t(0),l=t(14),d=t(3),j=t(129),b=t(133),m=t(158),h=t(152),u=t.n(h),O=t(153),v=t(25),x="MovieWatching/GET_BY_ID",f="MovieWatching/GET_COMMENT",_="MovieWatching/RELOAD_COMMET",g=function(){return Object(v.action)(_)},p=function(e){return e.MovieWatching},N=t(1);function y(){var e=Object(r.useState)(""),c=Object(b.a)(e,2),t=c[0],n=c[1],i=Object(l.c)(p).data,o=Object(r.useState)(),d=Object(b.a)(o,2),j=d[0],h=d[1],v=Object(r.useState)(),x=Object(b.a)(v,2),f=x[0],_=x[1],y=Object(l.b)();return Object(r.useEffect)((function(){if(null===i||void 0===i?void 0:i.id){var e,c,t=Object(m.a)(null!==(e="https://socket.web-movies.top")?e:"localhost:2999",{query:{movieId:null===i||void 0===i?void 0:i.id},extraHeaders:{authorization:"Bearer ".concat(null!==(c=localStorage.getItem("token"))&&void 0!==c?c:"")}});return h(t),t.on("connect",(function(){console.log("connected")})),t.on("disconnect",(function(){console.log("disconnect")})),function(){t.off("connect"),t.off("disconnect"),t.off("people_is_typing")}}}),[null===i||void 0===i?void 0:i.id]),j&&(j.on("people_is_typing",(function(e){_(e.user),setTimeout((function(){_("")}),5e3)})),j.on("comment_reload",(function(){y(g())}))),Object(N.jsxs)("div",{children:[f&&Object(N.jsxs)("p",{style:{color:"white"},children:[f," is typing..."]}),Object(N.jsxs)("form",{action:"#",className:"form",children:[Object(N.jsx)("textarea",{onChange:function(e){j.emit("comment_typing",{movieId:null===i||void 0===i?void 0:i.id}),n(e.target.value)},name:"text",className:"form__textarea",placeholder:"Add comment",value:t}),Object(N.jsx)("button",{onClick:Object(O.a)(u.a.mark((function e(){return u.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,Object(a.c)({method:"POST",url:s.a.COMMENT.POST,data:{content:t,movie:null===i||void 0===i?void 0:i.id}});case 2:j.emit("comment_post",{movieId:null===i||void 0===i?void 0:i.id}),y(g());case 4:case"end":return e.stop()}}),e)}))),type:"button",className:"form__btn",children:"Send"})]})]})}function w(){var e=Object(l.c)(p),c=(e.data,e.comments),t=e.reloadComment,n=Object(d.f)(),i=Object(d.h)().movieId,o=Object(l.b)();return Object(r.useEffect)((function(){Object(a.a)({method:"GET",url:s.a.COMMENT.GET_BY_MOVIE(i)}).then((function(e){o(function(e){return Object(v.action)(f,e)}(e.data))}))}),[i,t]),Object(N.jsx)("div",{className:"col-12 col-lg-8 col-xl-8",children:Object(N.jsx)("div",{className:"tab-content",children:Object(N.jsx)("div",{className:"tab-pane fade show active",id:"tab-1",role:"tabpanel","aria-labelledby":"1-tab",children:Object(N.jsx)("div",{className:"row",children:Object(N.jsx)("div",{className:"col-12",children:Object(N.jsxs)("div",{className:"comments",children:[Object(N.jsx)("ul",{className:"comments__list",children:c&&(null===c||void 0===c?void 0:c.length)>0&&(null===c||void 0===c?void 0:c.map((function(e,c){return Object(N.jsxs)("li",{className:"comments__item",children:[Object(N.jsxs)("div",{className:"comments__autor",children:[Object(N.jsx)("img",{className:"comments__avatar",src:"/img/user.svg",alt:""}),Object(N.jsx)("span",{className:"comments__name",children:e.account.username}),Object(N.jsx)("span",{className:"comments__time",children:new Date(e.createdAt).toLocaleDateString()})]}),Object(N.jsx)("p",{className:"comments__text",children:e.content}),Object(N.jsx)("div",{className:"comments__actions"})]})})))}),localStorage.getItem("token")?Object(N.jsx)(y,{}):Object(N.jsx)("button",{type:"button",className:"form__btn",onClick:function(){n.push("/signin")},children:"Login to comment"})]})})})})})})}function E(){var e=Object(l.c)(p).data,c=Object(r.useState)(),t=Object(b.a)(c,2),n=t[0],a=t[1],s=Object(r.useState)(),i=Object(b.a)(s,2),o=(i[0],i[1]);return Object(r.useEffect)((function(){if(null===e||void 0===e?void 0:e.id){var c,t,n=Object(m.a)(null!==(c="https://socket.web-movies.top")?c:"localhost:2999",{query:{movieId:null===e||void 0===e?void 0:e.id},extraHeaders:{authorization:"Bearer ".concat(null!==(t=localStorage.getItem("token"))&&void 0!==t?t:"")}});return a(n),n.on("connect",(function(){console.log("connected")})),n.on("disconnect",(function(){console.log("disconnect")})),function(){n.off("connect"),n.off("disconnect"),n.off("people_is_typing")}}}),[null===e||void 0===e?void 0:e.id]),n&&n.on("people_is_typing",(function(e){o(e.user),setTimeout((function(){o("")}),5e3)})),Object(N.jsx)(N.Fragment,{children:Object(N.jsxs)("section",{className:"content",children:[Object(N.jsx)("div",{className:"content__head",children:Object(N.jsx)("div",{className:"container",children:Object(N.jsx)("div",{className:"row",children:Object(N.jsxs)("div",{className:"col-12",children:[Object(N.jsx)("h2",{className:"content__title",children:"Discover"}),Object(N.jsx)("ul",{className:"nav nav-tabs content__tabs",id:"content__tabs",role:"tablist",children:Object(N.jsx)("li",{className:"nav-item",children:Object(N.jsx)("a",{className:"nav-link active","data-toggle":"tab",href:"#tab-1",role:"tab","aria-controls":"tab-1","aria-selected":"true",children:"Comments"})})})]})})})}),Object(N.jsx)("div",{className:"container",children:Object(N.jsx)("div",{className:"row",children:Object(N.jsx)(w,{})})})]})})}var k=t(135),C=t(172),T=t.n(C);function S(){var e,c,t=Object(l.c)(p).data;return Object(N.jsx)(N.Fragment,{children:Object(N.jsx)("section",{className:"section section--details section--bg","data-bg":"img/section/details.jpg",children:Object(N.jsx)("div",{className:"container",children:Object(N.jsxs)("div",{className:"row",children:[Object(N.jsx)("div",{className:"col-12",children:Object(N.jsx)("h1",{className:"section__title",children:null===t||void 0===t?void 0:t.originalTitle})}),Object(N.jsx)("div",{className:"col-12 col-lg-6",children:Object(N.jsx)("div",{className:"card card--details",children:Object(N.jsxs)("div",{className:"row",children:[Object(N.jsx)("div",{className:"col-12 col-sm-5 col-lg-6 col-xl-5",children:Object(N.jsxs)("div",{className:"card__cover",children:[Object(N.jsx)("img",{src:Object(k.b)(null===t||void 0===t?void 0:t.image),alt:null===t||void 0===t?void 0:t.originalTitle}),Object(N.jsx)("span",{className:"card__rate card__rate--green",children:null===t||void 0===t?void 0:t.avgVote})]})}),Object(N.jsx)("div",{className:"col-12 col-sm-7 col-lg-6 col-xl-7",children:Object(N.jsxs)("div",{className:"card__content",children:[Object(N.jsxs)("ul",{className:"card__meta",children:[Object(N.jsxs)("li",{children:[Object(N.jsx)("span",{children:"Director:"})," ",null===t||void 0===t?void 0:t.director]}),Object(N.jsxs)("li",{children:[Object(N.jsx)("span",{children:"Cast:"}),null===t||void 0===t||null===(e=t.actor)||void 0===e?void 0:e.map((function(e,c){return Object(N.jsx)(N.Fragment,{children:Object(N.jsx)("a",{href:"#",children:e.name})})}))]}),Object(N.jsxs)("li",{children:[Object(N.jsx)("span",{children:"Genre:"})," ",null===t||void 0===t||null===(c=t.tag)||void 0===c?void 0:c.map((function(e,c){return Object(N.jsx)(N.Fragment,{children:Object(N.jsx)("a",{href:"#",children:e.name})})}))]}),Object(N.jsxs)("li",{children:[Object(N.jsx)("span",{children:"Release year:"})," ",null===t||void 0===t?void 0:t.year]}),Object(N.jsxs)("li",{children:[Object(N.jsx)("span",{children:"Running time:"}),null===t||void 0===t?void 0:t.duration," min"]}),Object(N.jsxs)("li",{children:[Object(N.jsx)("span",{children:"Production Company:"})," ",Object(N.jsx)("a",{href:"#",children:null===t||void 0===t?void 0:t.productionCompany})]})]}),Object(N.jsxs)("div",{className:"card__description",children:["Description: ",null===t||void 0===t?void 0:t.description]})]})})]})})}),Object(N.jsx)("div",{className:"col-12 col-lg-6",children:(null===t||void 0===t?void 0:t.url)?Object(N.jsx)(T.a,{url:Object(k.b)(null===t||void 0===t?void 0:t.url),config:{file:{forceHLS:!0}},controls:!0}):Object(N.jsx)("h3",{style:{color:"white",fontSize:24},children:"'This movie will comming soon'"})})]})})})})}var M,I=t(4),D={data:void 0,comments:void 0,reloadComment:!1},F=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:D,c=arguments.length>1?arguments[1]:void 0;switch(c.type){case x:return Object(I.a)(Object(I.a)({},e),{},{data:c.payload});case f:return Object(I.a)(Object(I.a)({},e),{},{comments:c.payload});case _:return Object(I.a)(Object(I.a)({},e),{},{reloadComment:!e.reloadComment});default:return Object(I.a)({},e)}},B=t(12),G=t(11).c.div(M||(M=Object(B.a)([""])));function H(e){Object(n.a)(e),Object(j.a)("MovieWatching",F);var c=Object(d.h)().movieId,t=Object(l.b)();return Object(r.useEffect)((function(){Object(a.a)({method:"GET",url:s.a.MOVIE.GET_BY_ID(c)}).then((function(e){var c;t((c=e.data,Object(v.action)(x,c)))}))}),[c]),Object(N.jsx)(i.a,{children:Object(N.jsx)(o.a,{children:Object(N.jsx)(G,{children:Object(N.jsxs)("div",{children:[Object(N.jsx)(S,{}),Object(N.jsx)(E,{})]})})})})}c.default=Object(r.memo)(H)}}]);