(this["webpackJsonpmy-app"]=this["webpackJsonpmy-app"]||[]).push([[8],{120:function(e,t,s){"use strict";function c(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}s.d(t,"a",(function(){return c}))},121:function(e,t,s){"use strict";function c(e,t){for(var s=0;s<t.length;s++){var c=t[s];c.enumerable=c.enumerable||!1,c.configurable=!0,"value"in c&&(c.writable=!0),Object.defineProperty(e,c.key,c)}}function n(e,t,s){return t&&c(e.prototype,t),s&&c(e,s),e}s.d(t,"a",(function(){return n}))},122:function(e,t,s){"use strict";s.d(t,"a",(function(){return n}));var c=s(132);function n(e,t){if("function"!==typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function");e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,writable:!0,configurable:!0}}),t&&Object(c.a)(e,t)}},124:function(e,t,s){"use strict";s.d(t,"a",(function(){return o}));var c=s(126),n=s(134);function r(e){return r="function"===typeof Symbol&&"symbol"===typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"===typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e},r(e)}var a=s(128);function i(e,t){return!t||"object"!==r(t)&&"function"!==typeof t?Object(a.a)(e):t}function o(e){var t=Object(n.a)();return function(){var s,n=Object(c.a)(e);if(t){var r=Object(c.a)(this).constructor;s=Reflect.construct(n,arguments,r)}else s=n.apply(this,arguments);return i(this,s)}}},126:function(e,t,s){"use strict";function c(e){return c=Object.setPrototypeOf?Object.getPrototypeOf:function(e){return e.__proto__||Object.getPrototypeOf(e)},c(e)}s.d(t,"a",(function(){return c}))},127:function(e,t,s){"use strict";var c=s(120),n=s(121),r=s(122),a=s(124),i=s(0),o=s.n(i),l=s(1),d=function(e){Object(r.a)(s,e);var t=Object(a.a)(s);function s(e){var n;return Object(c.a)(this,s),(n=t.call(this,e)).state={hasError:!1},n}return Object(n.a)(s,[{key:"componentDidCatch",value:function(e,t){console.log("Error Boundry",e,t)}},{key:"render",value:function(){return this.state.hasError?Object(l.jsx)("span",{style:{color:"red"},children:"Error Boundry"}):this.props.children}}],[{key:"getDerivedStateFromError",value:function(e){return console.log("Error Boundry",e),{hasError:!0}}}]),s}(o.a.Component);t.a=d},128:function(e,t,s){"use strict";function c(e){if(void 0===e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}s.d(t,"a",(function(){return c}))},129:function(e,t,s){"use strict";var c=s(0),n=s.n(c),r=s(14);t.a=function(e,t){var s=Object(r.d)(),c=n.a.useRef(!1);c.current||(s.injectReducer(e,t),c.current=!0)}},132:function(e,t,s){"use strict";function c(e,t){return c=Object.setPrototypeOf||function(e,t){return e.__proto__=t,e},c(e,t)}s.d(t,"a",(function(){return c}))},134:function(e,t,s){"use strict";function c(){if("undefined"===typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"===typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}s.d(t,"a",(function(){return c}))},137:function(e,t,s){"use strict";s.d(t,"a",(function(){return y}));var c=s(12),n=s(37);var r,a=s(0),i=s(11),o=s(1);function l(e){Object(n.a)(e);var t={triggerScrollTop:function(){try{window.scroll({top:0,left:0,behavior:"smooth"})}catch(e){window.scrollTo(0,0)}}}.triggerScrollTop;return Object(o.jsx)(h,{children:Object(o.jsx)("footer",{className:"footer",children:Object(o.jsx)("div",{className:"container",children:Object(o.jsx)("div",{className:"row",children:Object(o.jsx)("div",{className:"col-12",children:Object(o.jsxs)("div",{className:"footer__content",children:[Object(o.jsx)("a",{href:"index.html",className:"footer__logo",children:Object(o.jsx)("img",{src:"img/logo.svg",alt:""})}),Object(o.jsxs)("span",{className:"footer__copyright",children:["\xa9 2020 HotFlix",Object(o.jsx)("br",{})," Create by"," ",Object(o.jsx)("a",{href:"https://themeforest.net/user/dmitryvolkov/portfolio",target:"_blank",rel:"noreferrer",children:"Dmitry Volkov"})]}),Object(o.jsxs)("nav",{className:"footer__nav",children:[Object(o.jsx)("a",{href:"about.html",children:"About Us"}),Object(o.jsx)("a",{href:"contacts.html",children:"Contacts"}),Object(o.jsx)("a",{href:"privacy.html",children:"Privacy Policy"})]}),Object(o.jsx)("button",{className:"footer__back",type:"button",onClick:function(e){e.preventDefault(),t()},children:Object(o.jsx)("i",{className:"icon ion-ios-arrow-round-up"})})]})})})})})})}var d,h=i.c.div(r||(r=Object(c.a)([""]))),j=Object(a.memo)(l),u=s(35),b=s(36),m=s(15),f=s(22),O=s(14),p=s(3),v=s(38);function x(e){Object(n.a)(e);var t=Object(O.c)(f.a).user,s=Object(O.b)(),c=Object(p.f)();return Object(a.useEffect)((function(){localStorage.getItem("token")&&Object(u.d)({method:"GET",url:b.a.USER.Me}).then((function(e){s(Object(m.b)(e.data))}))}),[]),Object(o.jsx)(_,{children:Object(o.jsx)("header",{className:"header",children:Object(o.jsx)("div",{className:"container",children:Object(o.jsx)("div",{className:"row",children:Object(o.jsx)("div",{className:"col-12",children:Object(o.jsxs)("div",{className:"header__content",children:[Object(o.jsx)(v.b,{to:"/",className:"header__logo",children:Object(o.jsx)("img",{src:"/img/logo.svg",alt:""})}),Object(o.jsxs)("ul",{className:"header__nav",children:[Object(o.jsx)("li",{className:"header__nav-item",children:Object(o.jsx)(v.b,{className:"dropdown-toggle header__nav-link",to:"/",children:"Home"})}),Object(o.jsx)("li",{className:"header__nav-item",children:Object(o.jsx)(v.b,{to:"/help",className:"header__nav-link",children:"Help"})})]}),Object(o.jsxs)("div",{className:"header__auth",children:[Object(o.jsx)(v.b,{to:"/search",className:"header__search",children:Object(o.jsx)("button",{className:"header__search-button",type:"button",children:Object(o.jsx)("i",{className:"icon ion-ios-search"})})}),Object(o.jsx)("div",{className:"dropdown header__lang",children:Object(o.jsx)("a",{className:"dropdown-toggle header__nav-link",href:"#",children:"EN"})}),(null===t||void 0===t?void 0:t.id)?Object(o.jsxs)(o.Fragment,{children:[Object(o.jsx)("a",{href:"#",className:"header__sign-in",children:Object(o.jsxs)("span",{children:[null===t||void 0===t?void 0:t.username.slice(0,10),"..."]})}),Object(o.jsx)("a",{href:"#",className:"header__sign-in",onClick:function(e){e.preventDefault(),localStorage.clear(),c.push("/signin")},children:Object(o.jsx)("span",{children:"Logout"})})]}):Object(o.jsx)(v.b,{to:"/signin",className:"header__sign-in",children:Object(o.jsx)("span",{children:"sign in"})})]})]})})})})})})}var _=i.c.div(d||(d=Object(c.a)([""]))),g=Object(a.memo)(x);function y(e){var t=e.children;return Object(o.jsxs)(o.Fragment,{children:[Object(o.jsx)(g,{}),Object(o.jsx)(o.Fragment,{children:t}),Object(o.jsx)(j,{})]})}},226:function(e,t,s){"use strict";s.r(t);var c,n=s(37),r=s(127),a=s(137),i=s(0),o=s(129),l=s(4),d={},h=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:d,t=arguments.length>1?arguments[1]:void 0;return t.type,Object(l.a)({},e)},j=s(12),u=s(11).c.div(c||(c=Object(j.a)([""]))),b=s(1);function m(e){return Object(n.a)(e),Object(o.a)("HelpPage",h),Object(b.jsx)(r.a,{children:Object(b.jsx)(a.a,{children:Object(b.jsxs)(u,{children:[" ",Object(b.jsx)("section",{className:"section section--first section--bg","data-bg":"img/section/section.jpg",style:{background:'url("img/section/section.jpg") center center / cover no-repeat'},children:Object(b.jsx)("div",{className:"container",children:Object(b.jsx)("div",{className:"row",children:Object(b.jsx)("div",{className:"col-12",children:Object(b.jsxs)("div",{className:"section__wrap",children:[Object(b.jsx)("h2",{className:"section__title",children:"FAQ"}),Object(b.jsxs)("ul",{className:"breadcrumb",children:[Object(b.jsx)("li",{className:"breadcrumb__item",children:Object(b.jsx)("a",{href:"/",children:"Home"})}),Object(b.jsx)("li",{className:"breadcrumb__item breadcrumb__item--active",children:"FAQ"})]})]})})})})}),Object(b.jsx)("section",{className:"section section--faq",children:Object(b.jsx)("div",{className:"container",children:Object(b.jsxs)("div",{className:"row",children:[Object(b.jsxs)("div",{className:"col-12 col-md-6",children:[Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"Why is a Video is not loading?"}),Object(b.jsx)("p",{className:"faq__text",children:"All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"Why isn't there a HD version of this video?"}),Object(b.jsx)("p",{className:"faq__text",children:"Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"Why is the sound distorted?"}),Object(b.jsx)("p",{className:"faq__text",children:"Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"Why is the Video stuttering, buffering or randomly stopping?"}),Object(b.jsx)("p",{className:"faq__text",children:"There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"When I change the quality of a video, nothing happens."}),Object(b.jsx)("p",{className:"faq__text",children:"If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."})]})]}),Object(b.jsxs)("div",{className:"col-12 col-md-6",children:[Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"Why isn't the video starting at the beginning?"}),Object(b.jsx)("p",{className:"faq__text",children:"The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"How do I make the Video go Fullscreen?"}),Object(b.jsx)("p",{className:"faq__text",children:"It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"What Browsers are supported?"}),Object(b.jsx)("p",{className:"faq__text",children:"It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"How do you handle my privacy?"}),Object(b.jsx)("p",{className:"faq__text",children:"Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."})]}),Object(b.jsxs)("div",{className:"faq",children:[Object(b.jsx)("h3",{className:"faq__title",children:"How can I contact you?"}),Object(b.jsx)("p",{className:"faq__text",children:"The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."})]})]})]})})})]})})})}t.default=Object(i.memo)(m)}}]);