!function(e){"ace"in window||(window.ace={}),"helper"in window.ace||(window.ace.helper={}),"vars"in window.ace||(window.ace.vars={}),window.ace.vars.icon=" ace-icon ",window.ace.vars[".icon"]=".ace-icon",ace.vars.touch="ontouchstart"in window;var a=navigator.userAgent;ace.vars.webkit=!!a.match(/AppleWebKit/i),ace.vars.safari=!!a.match(/Safari/i)&&!a.match(/Chrome/i),ace.vars.android=ace.vars.safari&&!!a.match(/Android/i),ace.vars.ios_safari=!!a.match(/OS ([4-9])(_\d)+ like Mac OS X/i)&&!a.match(/CriOS/i),ace.vars.ie=window.navigator.msPointerEnabled||document.all&&document.querySelector,ace.vars.old_ie=document.all&&!document.addEventListener,ace.vars.very_old_ie=document.all&&!document.querySelector,ace.vars.firefox="MozAppearance"in document.documentElement.style,ace.vars.non_auto_fixed=ace.vars.android||ace.vars.ios_safari,ace.click_event=ace.vars.touch&&jQuery.fn.tap?"tap":"click"}(),function(e,a){e.unCamelCase=function(e){return e.replace(/([a-z])([A-Z])/g,function(e,a,n){return a+"-"+n.toLowerCase()})},e.strToVal=function(e){var a=e.match(/^(?:(true)|(false)|(null)|(\-?[\d]+(?:\.[\d]+)?)|(\[.*\]|\{.*\}))$/i),n=e;if(a)if(a[1])n=!0;else if(a[2])n=!1;else if(a[3])n=null;else if(a[4])n=parseFloat(e);else if(a[5])try{n=JSON.parse(e)}catch(t){}return n},e.getAttrSettings=function(a,n,t){if(a){var i=n instanceof Array?1:2,t=t?t.replace(/([^\-])$/,"$1-"):"";t="data-"+t;var r={};for(var c in n)if(n.hasOwnProperty(c)){var o,s=1==i?n[c]:c,l=e.unCamelCase(s.replace(/[^A-Za-z0-9]{1,}/g,"-")).toLowerCase();if(!(o=a.getAttribute(t+l)))continue;r[s]=e.strToVal(o)}return r}},e.scrollTop=function(){return document.scrollTop||document.documentElement.scrollTop||document.body.scrollTop},e.winHeight=function(){return window.innerHeight||document.documentElement.clientHeight},e.redraw=function(e,a){if(e){var n=e.style.display;e.style.display="none",e.offsetHeight,a!==!0?e.style.display=n:setTimeout(function(){e.style.display=n},10)}}}(ace.helper);