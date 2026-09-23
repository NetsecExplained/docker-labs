/**
 *	Erzeugt einen Query als Schluessel-Wert-Paar
 *	@param k
 *	@param v
 */
function Query(k, v){
	v = v || "";
	var key = k.trim();
	var value = encodeURIComponent(v.toString().trim());
	this.toString = function(){
		return key + "=" + value + "&";
	};
}	

/**
 * Erzeugt eine Anfrage und uebergibt die Antwort an eine Funktion
 * als XML oder String
 *
 * @param uri
 * @param m
 * @param obj
 * @param func
 * @param resXML
 * @param mimeType
 *
 */
function Request(uri,m,q,obj,func,args,resXML,mimeType){
		args = args?(typeof args == "object"?args:[args]):[];
		resXML  = resXML || false;
		mimeType = mimeType?mimeType:resXML?"text/xml":"text/plain";
		obj = obj || null;
		var httpRequest = false;
		try{
			if (window.XMLHttpRequest) 
				httpRequest = new XMLHttpRequest();
				if (httpRequest.overrideMimeType)
					httpRequest.overrideMimeType(mimeType);
			else if (window.ActiveXObject) {
				try {
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (er) {
						httpRequest = false;
					}
				}
			}
		}
		catch(err) {
			httpRequest = false;
		}	
		if (!httpRequest) {
			if (obj && typeof obj[func] == "function") 
				obj[func](false, args);
			return;
		}
		var qStr = "";	
		if (q instanceof Query)
			qStr = q.toString();
		else if(typeof q == "object" && q.length > 0)
			for (var i=0; i<q.length; i++)
				qStr += q[i].toString();
		qStr +=	new Date().getTime();
		httpRequest.abort();
		httpRequest.onreadystatechange = function() {
			if (httpRequest.readyState == 4) { 
				if (obj && typeof obj[func] == "function") {
					obj[func]( (resXML?httpRequest.responseXML:httpRequest.responseText), args);				
				}
				httpRequest = false;
			}
		};
		if (m.toLowerCase() == "post"){
			httpRequest.open("POST", uri, true);
			httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			httpRequest.send( qStr );
		}
		else {
			httpRequest.open("GET", uri+"?"+qStr, true);
			httpRequest.send(null);
		}
	}


/**
 * Liefert das Element, auf dem das Event ausgeloest wurde
 * @return tar
 */
document.getTarget = function(e) {
	e = e || window.event;
	return e.target || e.srcElement || false;
};

/**
 * Liefert die Position und Groesse eines Elements im Dokument
 * @param el
 * @return elPositionAndSize
 * @see http://www.quirksmode.org/js/findpos.html
 */
document.getElementPoSi = function(el){
    var r = { top:0, left:0, width:0, height:0 };
 
    if(!el || typeof(el) != 'object') 
		return r;
 
    if(typeof(el.offsetTop) != 'undefined')    {
         r.height = el.offsetHeight;
         r.width  = el.offsetWidth;
         r.left   = r.top = 0;
         while(el && el.tagName != 'BODY') {
            r.top  += parseInt( el.offsetTop );
            r.left += parseInt( el.offsetLeft );
			
            el = el.offsetParent;
         }
    }
    return r;
};

/**
 * Liefert die Koordinaten 
 * des letzten Maus-Klicks
 * @param e
 * @return pos
 * @see http://forum.de.selfhtml.org/archiv/2006/1/t121722/#m782727
 */
document.getMousePos = function(e) {
	e =  e || window.event;
	var body = (window.document.compatMode && window.document.compatMode == "CSS1Compat") ? 
	window.document.documentElement : window.document.body;
	return {
		top: e.pageY ? e.pageY : e.clientY + body.scrollTop - body.clientTop,
		left: e.pageX ? e.pageX : e.clientX + body.scrollLeft  - body.clientLeft
	};
};

/**
 *
 * Author: Torben Brodt
 * Summary: Cross-browser wrapper for DOMContentLoaded
 * Updated: 07/09/2009
 * License: MIT / GPL
 * Version: 1.1
 *
 * URL:
 * @see http://www.easy-coding.de
 * @see http://jquery.com/dev/svn/trunk/jquery/MIT-LICENSE.txt
 * @see http://jquery.com/dev/svn/trunk/jquery/GPL-LICENSE.txt
 *
 * A page has loaded after all external resources like images have been loaded.
 * Should all scripts wait for that? a better bevaviour is to wait for the dom content being ready.
 *
 * This script has workarounds for all the big browsers meaning the major versions of firefox, internet explorer, opera, safari and chrome.
 * You can use it without risk, since the normal "onload" behavior is the fallback solution.
 *
 * Most of the source is lended from jquery
 */
var ready = new (function () {
	var readyBound = 0, d = document, w = window, t = this, x;
	t.isReady = 0;
	t.readyList = [];
 
	function bindReady() {
		if ( readyBound ) return;
		readyBound = 1;
 
		// Mozilla, Opera and webkit nightlies currently support this event
		if ( d.addEventListener ) {
			// Use the handy event callback
			x = "DOMContentLoaded";
			d.addEventListener( x, function(){
				d.removeEventListener( x, arguments.callee, false );
				ready.ready();
			}, false );
 
		// If IE event model is used
		} else if ( d.attachEvent ) {
			// ensure firing before onload,
			// maybe late but safe also for iframes
			x = "onreadystatechange";
			d.attachEvent(x, function(){
				if ( d.readyState === "complete" ) {
					d.detachEvent( x, arguments.callee );
					ready.ready();
				}
			});
 
			// If IE and not an iframe
			// continually check to see if the document is ready
			if ( d.documentElement.doScroll && w == w.top ) (function(){
				if ( t.isReady ) return;
 
				try {
					// If IE is used, use the trick by Diego Perini
					// [url]http://javascript.nwbox.com/IEContentLoaded/[/url]
					d.documentElement.doScroll("left");
				} catch( error ) {
					setTimeout( arguments.callee, 0 );
					return;
				}
 
				// and execute any waiting functions
				ready.ready();
			})();
		}
 
		// A fallback to window.onload, that will always work
		w.onload = ready.ready; // TODO: compliant? t.event.add( window, "load", t.ready );
	};
 
	// Handle when the DOM is ready
	t.ready = function() {
		// Make sure that the DOM is not already loaded
		if ( !t.isReady ) {
			// Remember that the DOM is ready
			t.isReady = 1;
 
			// If there are functions bound, to execute
			if ( t.readyList ) {
				// Execute all of them
				for(var i=0; i<t.readyList.length; i++) {
					t.readyList[i].call( w, t );
				};
 
				// Reset the list of functions
				t.readyList = null;
			}
 
			// Trigger any bound ready events
			d.loaded = true; // TODO: compliant? this(document).triggerHandler("ready");
		}
	};
 
	// adds funtion to readyList if not ready yet, otherwise call immediately
	t.push = function(fn) {
		// Attach the listeners
		bindReady();
 
		// If the DOM is already ready
		if ( t.isReady )
			// Execute the function immediately
			fn.call( w, t );
 
		// Otherwise, remember the function for later
		else
			// Add the function to the wait list
			t.readyList.push( fn );
 
		return t;
	};
})();

function on_load(mode)
 {
  switch (mode)
   {
    case 'edit':
     hideformparts();
     if((typeof use_fckeditor) != 'undefined') fckeditor_init();
     break;
    case 'login':
     sf();
    //default:
  }
 }

function sf()
 {
  document.getElementById('login').focus();
 }

function hideformparts()
 {
  document.getElementById('formpart-n1').style.display='block';
  document.getElementById('formpart-n2').style.display='none';
  document.getElementById('formpart-n3').style.display='none';
  document.getElementById('formpart-n4').style.display='none';
  document.getElementById('formpart-n5').style.display='none';
  document.getElementById('formpart-n6').style.display='none';
 }

function show_element(e)
 {
  document.getElementById('n1').className='inactive';
  document.getElementById('n2').className='inactive';
  document.getElementById('n3').className='inactive';
  document.getElementById('n4').className='inactive';
  document.getElementById('n5').className='inactive';
  document.getElementById('n6').className='inactive';
  document.getElementById(e).className='active';
  document.getElementById('formpart-n1').style.display='none';
  document.getElementById('formpart-n2').style.display='none';
  document.getElementById('formpart-n3').style.display='none';
  document.getElementById('formpart-n4').style.display='none';
  document.getElementById('formpart-n5').style.display='none';
  document.getElementById('formpart-n6').style.display='none';
  document.getElementById('formpart-'+e).style.display='block';
  return false;
 }

function insert_image(form,field,insert_mode)
 {
  new_window=window.open('admin.php?mode=image&form='+form+'&field='+field+'&insert_mode='+insert_mode,'image','toolbar=no,scrollbars=yes,resizable=yes,status=no,menubar=no,location=no,width=500,height=450');
  new_window.focus();
  return false;
 }

function insert_thumbnail(form,field,insert_mode)
 {
  new_window=window.open('admin.php?mode=thumbnail&form='+form+'&field='+field,'image','toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,location=no,width=500,height=400');
  new_window.focus();
  return false;
 }

function insert_html(opentag,closetag,form,field)
 {
 if(closetag=='') insert(form,field,opentag);
 else
 {
 if(document.selection) // for IE
   {
    var str = document.selection.createRange().text;
    document.forms[form].elements[field].focus();
    var sel = document.selection.createRange();
    sel.text = opentag + str + closetag;
    return;
   }
  else if((typeof document.forms[form].elements[field].selectionStart) != 'undefined') // for Mozilla
   {
    var txtarea = document.forms[form].elements[field];
    var selLength = txtarea.textLength;
    var selStart = txtarea.selectionStart;
    var selEnd = txtarea.selectionEnd;
    var oldScrollTop = txtarea.scrollTop;
    var s1 = (txtarea.value).substring(0,selStart);
    var s2 = (txtarea.value).substring(selStart, selEnd)
    var s3 = (txtarea.value).substring(selEnd, selLength);
    txtarea.value = s1 + opentag + s2 + closetag + s3;
    txtarea.selectionStart = s1.length;
    txtarea.selectionEnd = s1.length + opentag.length + s2.length + closetag.length;
    txtarea.scrollTop = oldScrollTop;
    txtarea.focus();
    return;
   }
  else insert(form,field,opentag+closetag+' ');
 }
 }

function format(v,form,field)
 {
 if (document.selection) // for IE
   {
    var str = document.selection.createRange().text;
    document.forms[form].elements[field].focus();
    var sel = document.selection.createRange();
    sel.text = "<" + v + ">" + str + "</" + v + ">";
    return;
   }
  else if ((typeof document.forms[form].elements[field].selectionStart) != 'undefined') // for Mozilla
   {
    var txtarea = document.forms[form].elements[field];
    var selLength = txtarea.textLength;
    var selStart = txtarea.selectionStart;
    var selEnd = txtarea.selectionEnd;
    var oldScrollTop = txtarea.scrollTop;
    var s1 = (txtarea.value).substring(0,selStart);
    var s2 = (txtarea.value).substring(selStart, selEnd)
    var s3 = (txtarea.value).substring(selEnd, selLength);
    txtarea.value = s1 + '<' + v + '>' + s2 + '</' + v + '>' + s3;
    txtarea.selectionStart = s1.length;
    txtarea.selectionEnd = s1.length + 5 + s2.length + v.length * 2;
    txtarea.scrollTop = oldScrollTop;
    txtarea.focus();
    return;
   }
  else insert(form,field,'<' + v + '></' + v + '> ');
 }

function insert_link(form,field,link_text,link_target)
 {
 if (document.selection) // for IE
   {
    var str = document.selection.createRange().text;
    document.forms[form].elements[field].focus();
    var sel = document.selection.createRange();
    var insert_link = prompt(link_target,'');
    if(sel.text=='' && insert_link!='' && insert_link!=null) str = prompt(link_text,'');

    if(insert_link && str!=null)
     {
      if(str!='')
       {
        sel.text = "[[" + insert_link + "|" + str + "]]";
       }
      else
       {
        sel.text = "[[" + insert_link + "]]";
       }
     }
    return;
   }
  else if ((typeof document.forms[form].elements[field].selectionStart) != 'undefined') // for Mozilla
   {
    var txtarea = document.forms[form].elements[field];
    var selLength = txtarea.textLength;
    var selStart = txtarea.selectionStart;
    var selEnd = txtarea.selectionEnd;
    var oldScrollTop = txtarea.scrollTop;
    var s1 = (txtarea.value).substring(0,selStart);
    var s2 = (txtarea.value).substring(selStart, selEnd);
    var s3 = (txtarea.value).substring(selEnd, selLength);

    var insert_link = prompt(link_target,'');
    if(selEnd-selStart==0 && insert_link!='' && insert_link!=null) s2 = prompt(link_text,'');
    if(insert_link && s2!=null)
     {
      if(s2!='')
       {
        txtarea.value = s1 + '[[' + insert_link + '|' + s2 + ']]' + s3;
        var codelength = 5 + insert_link.length + s2.length;
       }
      else
       {
        txtarea.value = s1 + '[[' + insert_link + ']]' + s3;
        var codelength = 4 + insert_link.length + s2.length;
       }
      txtarea.selectionStart = s1.length;
      txtarea.selectionEnd = s1.length + codelength;
      txtarea.scrollTop = oldScrollTop;
      txtarea.focus();
      return;
     }
   }
  else insert('[[Link|Link text]]');
 }

function insert(form,field,what)
 {
  if (document.forms[form].elements[field].createTextRange)
   {
    document.forms[form].elements[field].focus();
    document.selection.createRange().duplicate().text = what;
   }
  else if ((typeof document.forms[form].elements[field].selectionStart) != 'undefined') // for Mozilla
   {
    var tarea = document.forms[form].elements[field];
    var selEnd = tarea.selectionEnd;
    var txtLen = tarea.value.length;
    var txtbefore = tarea.value.substring(0,selEnd);
    var txtafter =  tarea.value.substring(selEnd, txtLen);
    var oldScrollTop = tarea.scrollTop;
    tarea.value = txtbefore + what + txtafter;
    tarea.selectionStart = txtbefore.length + what.length;
    tarea.selectionEnd = txtbefore.length + what.length;
    tarea.scrollTop = oldScrollTop;
    tarea.focus();
   }
  else
   {
    document.forms[form].elements[field].value += what;
    document.forms[form].elements[field].focus();
   }
 }

function image_popup(img)
{
 if(img!="")
  {
   //img = '../images/'+img;
   window.open(img,'popup','width=400,height=300,toolbar=0,scrollbars=0,resizable=yes,status=no,menubar=no,location=no,screenX=100,screenY=100,left=100,top=100');
  }
}

function checkall(form, check)
{
 var elts = (typeof(document.forms[form].elements['checked[]']) != 'undefined')
                  ? document.forms[form].elements['checked[]']
                  : 0;

 var elts_cnt  = (typeof(elts.length) != 'undefined')
                  ? elts.length
                  : 0;
 if (elts_cnt)
  {
   for (var i = 0; i < elts_cnt; i++)
    {
     elts[i].checked = check;
    }
  }
 else
  {
   elts.checked = check;
  }
 return true;
}

function confirm_link(confirm_message,this_link,mode)
 {
  this_link = typeof(this_link) != 'undefined' ? this_link : '';
  mode = typeof(mode) != 'undefined' ? mode : 0;
  var confirmed = confirm(decodeURIComponent(confirm_message));
  if(confirmed && this_link!='')
   {
    if(mode==0)
     {
      this_link.href += '&confirmed=true';
     }
    else
     {
      this_link.href += ',confirmed';
     }
   }
  return confirmed;
 }

/**
 * DragAndDropTable ermoeglicht das Tauschen von 
 * Zeilen (TR) innerhalb von TBODY
 *
 * @param table
 * @see http://www.isocra.com/2007/07/dragging-and-dropping-table-rows-in-javascript/
 */
function DragAndDropTable(table) {
	if (!table)
		return;
	var isChanged = false;
	var rows = table.tBodies[0].rows;
	var dragObject = null;
	var oldOnMouseUpFunc   = window.document.onmouseup;
	var oldOnMouseMoveFunc = window.document.onmousemove;
	var tableTop = 0;
	var rowList = [];
	var getLocationQueryByParameter = function(par) {
		var q = window.document.location.search.substring(1).split('&');
		if(!q.length) 
			return false;
		for(var i=0; i<q.length; i++){
			var v = q[i].split('=');
			if (decodeURIComponent(v[0]) == par)
				return v.length>1?decodeURIComponent(v[1]):"";
		}
	};
	
	var saveNewOrder = function() {
		if (!isChanged)
			return;
		var page  = getLocationQueryByParameter("mode");
		var order = getRowOrder();
		if (!page || !order)
			return;
		var querys = [
				new Query("mode",   "ajaxprocess"),
				new Query("action", "reorder"),
				new Query(page, order)
		];
		new Request("admin.php", "POST", querys);
	};
	
	var updateClasses = function() {
		for (var i=0; i<rows.length; i++)
			rows[i].className = (i%2==0)?"a":"b";
	};
	
	var getRowOrder = function() {
		var order = "";
		for (var i=0; i<rows.length; i++)
			if (rows[i].id.length > 3)
				order += rows[i].id.substring(3) + ",";
		return order.substr(0, order.length-1);
	};
	
	var ondrag = function(row) {
		if (!row)
			return;
    };
	
	var ondrop = function(row) {
		if (!row)
			return;
		updateClasses();
		saveNewOrder();
    };
	
	var start = function() {
		window.document.onmousemove = function(e) {
			if (typeof oldOnMouseMoveFunc == "function")
				oldOnMouseMoveFunc(e);
			if (!dragObject)
				return;
			var mPos = document.getMousePos(e);
			var currentTop = mPos.top - dragObject.handlePos.top + dragObject.elementPos.top;
            var currentRow = findDropTargetRow( currentTop );
            if (tableTop != currentTop && currentRow && dragObject != currentRow) {
				var movingDown = currentTop > tableTop;
				tableTop = currentTop;
                
				if (movingDown)
					currentRow = currentRow.nextSibling;
				dragObject.parentNode.insertBefore(dragObject, currentRow);
				isChanged = true;
				ondrag(dragObject);
            }
			
			if(e && e.preventDefault) 
				e.preventDefault();
			return false;
		};
		
		window.document.onmouseup = function (e) {
			window.document.onmouseup = window.document.onmousemove = null;
			if (typeof oldOnMouseUpFunc == "function")
				oldOnMouseUpFunc(e);
			if (typeof oldOnMouseMoveFunc == "function")
				window.document.onmousemove = oldOnMouseMoveFunc;
			ondrop(dragObject);
			dragObject = null;
			isChanged = false;
			return false;
		};
	};
	
	var findDropTargetRow = function(top) {
        for (var i=0; i<rows.length; i++) {
			var rowPoSi = document.getElementPoSi(rows[i]);
			var h = rowPoSi.height;
			if (h == 0 && row[i].firstChild) {
				rowPoSi = document.getElementPoSi(row[i].firstChild);
				h = row[i].firstChild.offsetHeight;
			}
			h /= 2;
			if ((top >= (rowPoSi.top - h)) && (top < (rowPoSi.top + h))) {
				return rows[i];
			}
		}
		return null;
	};
		
	var add = function(row) {
		row.style.cursor = "move";
		//row.title = lang["drag_and_drop_title"];
		row.onmousedown = function(e){
			isChanged = false;
			var obj = document.getTarget(e);
			if (obj && obj.className.search(/control/) != -1)
				return false;
			this.className = "drag";
			this.elementPos = document.getElementPoSi(this);
			this.handlePos  = document.getMousePos(e);
			dragObject = this; 
			start();
			return false;  
		};	
		
		var links = row.cells[row.cells.length-1].getElementsByTagName("a");
		if (links && links.length > 0) {
			for (var i=0; i<links.length; i++) {
				if (links[i].href.search(/move_up/) != -1) 
					links[i].onclick = function(e) {
						row.parentNode.insertBefore(row, rows[Math.max(row.rowIndex-2,0)]);
						isChanged = true;
						updateClasses();
						saveNewOrder();
						return false;
					};
				else if (links[i].href.search(/move_down/) != -1)
					links[i].onclick = function(e) {
						row.parentNode.insertBefore(row, rows[Math.min(row.rowIndex+1, rows.length)]);
						updateClasses();
						isChanged = true;
						saveNewOrder();
						return false;
					};
			}
		}
	};
	
	
	
	(function() {
		for (var i=0; i<rows.length; i++){
			if(rows[i].className.search(/nodrag/) == -1) add(rows[i]);
		}
	}());
}

window.ready.push(function() {
	new DragAndDropTable(document.getElementById("sortable"));
});
