
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% String cPath = request.getContextPath(); %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*"%>
	<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",-1);
%>
<html>
<%	
if(session.getAttribute("username")==null){
	System.out.println("username is null viewtransaction.jsp");
	ServletContext sc=this.getServletContext();
	RequestDispatcher rd=sc.getRequestDispatcher("/index.jsp");
	rd.forward(request, response);
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pantawid Pamilyang Pilipino Program</title>
<link rel="stylesheet" href="<%= cPath %>/css/home.css"/>
<link rel="stylesheet" type="text/css" href="<%= cPath %>/pro_drop_1/pro_drop_1.css" />
<link type="text/css" href="<%= cPath %>/css/cupertino/jquery-ui-1.8.16.custom.css" rel="stylesheet" />	
<link rel="stylesheet" type="text/css" href="<%= cPath %>/css/transaction.css" />
<link rel="shotcut icon" href="<%= cPath %>/image/home.png" type="image/x-icon" />
<link rel="stylesheet" href="<%= cPath %>/development-bundle/themes/base/jquery.ui.all.css">
<script type="text/javascript" src="<%= cPath %>/js/jquery.js"></script>
<script type="text/javascript" src="<%= cPath %>/js/ajax.js"></script>
<script type="text/javascript" src="<%= cPath %>/js/ajax3.js"></script>
<script type="text/javascript" src="<%= cPath %>/js/ajaxx.js"></script>
<script src="<%=cPath %>/development-bundle/jquery-1.6.2.js"></script>
	<script src="<%=cPath %>/development-bundle/ui/jquery.ui.core.js"></script>
	<script src="<%=cPath %>/development-bundle/ui/jquery.ui.widget.js"></script>
	<script src="<%=cPath %>/development-bundle/ui/jquery.ui.button.js"></script>
	<script type="text/javascript" src="<%=cPath %>/development-bundle/ui/jquery.ui.dialog.js"></script>
	<script type="text/javascript" src="<%=cPath %>/development-bundle/ui/jquery-ui-1.8.16.custom.js"></script><%-- 
<script type="text/javascript" src="<%=cPath %>/js/jquery_ui.js"></script>
<script type="text/javascript" src="<%= cPath %>/js/jquery-1.6.2.min.js"></script>
<script src="<%= cPath %>/development-bundle/external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="<%= cPath %>/js/jquery-ui-1.8.16.custom.min.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.core.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.widget.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.mouse.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.draggable.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.position.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.resizable.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.ui.dialog.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.effects.core.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.effects.blind.js"></script>
<script src="<%= cPath %>/development-bundle/ui/jquery.effects.explode.js"></script>
<script type="text/javascript" src="<%=cPath %>/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="<%=cPath %>/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="<%=cPath %>/js/jquery.ui.button.js"></script>
<script type="text/javascript" src="<%=cPath %>/js/jquery.ui.position.js"></script>
<script type="text/javascript" src="<%=cPath %>/js/jquery.ui.autocomplete.js"></script> --%>
<script type="text/javascript" src="<%= cPath %>/development-bundle/ui/jquery.ui.datepicker.js"></script>
<link rel="stylesheet" href="<%= cPath %>/development-bundle/demos/demos.css">
<script type="text/javascript" src="<%= cPath %>/js/pages.js"></script>
<link type="text/css" href="<%= cPath %>/css/cupertino/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src="<%=cPath %>/js/displayTimeDate.js"></script> 
<link rel="stylesheet" type="text/css" href="<%=cPath %>/css/displayTimeDate.css"/>	
<script type="text/javascript">

var controller = 0;


$(document).ready(function(){
	$(window).unload(function(){});
	
});
	$(document).ready(function (){
		
		$("#br2").hide();
		$("#div").hide();
		$("#overlay").hide();
		
	    $.widget( "ui.combobox", {
	        _create: function() {
	          var self = this;
	          var select = this.element.hide(),
	            selected = select.children( ":selected" ),
	            value = selected.val() ? selected.text() : "";
	          var input = $( "<input />" )
	          	.css('height','25px')
	          	.css('width','200px')
	            .insertAfter(select)
	            .val( value )
	            .autocomplete({
	              delay: 0,
	              minLength: 0,
	              source: function(request, response) {
	                var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
	                response( select.children("option" ).map(function() {
	                  var text = $( this ).text();
	                  if ( this.value && ( !request.term || matcher.test(text) ) )
	                    return {
	                      label: text.replace(
	                        new RegExp(
	                          "(?![^&;]+;)(?!<[^<>]*)(" +
	                          $.ui.autocomplete.escapeRegex(request.term) +
	                          ")(?![^<>]*>)(?![^&;]+;)", "gi"),
	                        "<strong>$1</strong>"),
	                      value: text,
	                      option: this
	                    };
	                }) );
	              },
	              select: function( event, ui ) {
	                ui.item.option.selected = true;
	                self._trigger( "selected", event, {
	                  item: ui.item.option
	                });
	              },
	              change: function(event, ui) {
	                if ( !ui.item ) {
	                  var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( $(this).val() ) + "$", "i" ),
	                  valid = false;
	                  select.children( "option" ).each(function() {
	                    if ( this.value.match( matcher ) ) {
	                      this.selected = valid = true;
	                      return false;
	                    }
	                  });
	                  if ( !valid ) {
	                    // remove invalid value, as it didn't match anything
	                    $( this ).val( "" );
	                    select.val( "" );
	                    return false;
	                  }
	                }
	              }
	            })
	            .addClass("ui-widget ui-widget-content ui-corner-left");
	         
	          input.data( "autocomplete" )._renderItem = function( ul, item ) {
	            return $( "<li></li>" )
	              .data( "item.autocomplete", item )
	              .append( "<a>" + item.label + "</a>" )
	              .appendTo( ul );
	          };
	         
	          $( "<button> </button>" )
	          .css('padding-top','9px')
	          .css('padding-bottom','9px')
	          .attr( "tabIndex", -1 )
	          .attr( "title", "Show All Items" )
	          .insertAfter( input )
	          .button({
	            icons: {
	              primary: "ui-icon-triangle-1-s"
	            },
	            text: false
	          })
	          .removeClass( "ui-corner-all" )
	          .addClass( "ui-corner-right ui-button-icon" )
	          .click(function() {
	            // close if already visible
	            if (input.autocomplete("widget").is(":visible")) {
	              input.autocomplete("close");
	              return;
	            }
	            // pass empty string as value to search for, displaying all results
	            input.autocomplete("search", "");
	            input.focus();
	          });
	        }
	      });


		
		 $('tbody1 tr:odd', $('#display')).hide(); //hiding rows for test
		    var options = {
		      currPage : 1, 
		      ignoreRows : $('tbody1 tr:odd', $('#display')),
		      optionsForRows : [10],
		      rowsPerPage : 10,
		      firstArrow : (new Image()).src="<%= cPath %>/images/firstBlue.gif",
		      prevArrow : (new Image()).src="<%= cPath %>/images/prevBlue.gif",
		      lastArrow : (new Image()).src="<%= cPath %>/images/lastBlue.gif",
		      nextArrow : (new Image()).src="<%= cPath %>/images/nextBlue.gif",
		      topNav : false
		    };
		    $('#display').tablePagination(options);

		
		$("#search_field").keyup(function(){
			var name=document.getElementById("search_field").value;
			var transaction=document.getElementById("transaction").value;
			$("#br2").hide();
			$("#brgy_select").hide();
			if(transaction=='municipal'){
				$("#br2").hide();
				var mun=document.getElementById("munc").value;
				var brgay=document.getElementById("brgay").value;
				//alert("in?");
				if(mun!=null && brgay!='Brgy'){
					/* xhrGo("POST","TransactionView?municipal="+mun+"&transaction="+transaction+"&brgy="+brgay+"&name="+name, "plain"); */
					$.getJSON('Autocom',{municipal:mun,transaction:transaction,brgy:brgay,name:name},function(result){
						var pval=result.list;
						var tval=new Array();
						for(var i=0;i<pval.length;i++){
							tval[i]=pval[i];
						}
						$("#search_field").autocomplete({
							source:tval
						});
					});
					
				}else if(mun!=null && brgay=='Brgy'){
					$("#br2").hide();
					/* xhrGo("POST","TransactionView?municipal="+mun+"&transaction="+transaction+"&name="+name,  "plain"); */
					$.getJSON('Autocom',{municipal:mun,transaction:transaction,name:name},function(result){
						var pval=result.list;
						var tval=new Array();
						 for(var i=0;i<pval.length;i++){
							tval[i]=pval[i];
						}
						$("#search_field").autocomplete({
							source:tval
						});
					});
				}
			} else{ 
				
				/* xhrGo("POST","TransactionView?name="+name+"&transaction="+transaction, display, "plain"); */
				$("#br2").hide();
				$.getJSON('Autocom',{transaction:transaction,name:name},function(result){
				//alert(result.list);
					 var pval=result.list;
					 var tval=new Array();
					 
					 for(var i=0;i<pval.length;i++){
						tval[i]=pval[i];
					 }
					 $("#search_field").autocomplete({
						source:tval
				     });
			 	});
			} 
		});
		$("#container").hide();
		$("#container1").hide();
		$("#container2").hide();
		$("#container3").hide();
		$("#container4").hide();
		$("#message").hide();
		$("#mun").hide();
		$("#br").hide();
		$("#brgy_select").hide();
		$("#transaction").change(function(){
			var name=document.getElementById("search_field").value;
			var transaction=document.getElementById("transaction").value;
			document.getElementById("search_field").value ="";
			document.getElementById("date").value = "";
			var municipality=document.getElementById("transaction").value;
			 if(transaction=='municipal'){
				$( "#mun" ).fadeIn('slow');
				$( "#munc" ).focus();
				$( "#br" ).fadeIn( 'slow');
				$("#search_field").hide();
				$("#date").hide();
				$("#brgy_select").hide();
			}
			else if(transaction=='brgy'){
				//$( "#mun" ).fadeIn('slow');
				//$( "#munc" ).focus();
				//$( "#br" ).fadeIn( 'slow');
				/* $("#search_field").hide();
				$("#date").hide();
				$("#mun").hide();
				$("#br").hide();
				$("#brgy_select").show( 'drop', 500).focus();
				  */
				 // alert("in");
				  
			 }
			else if(transaction=='birth'){
				$("#brgy_select").hide();
				$("#br2").hide();
				$("#mun").hide();
				$("#br").hide();
				$( "#date" ).show( 'drop', 500);
				$("#search_field").hide();
				$( "#date" ).datepicker({
					changeMonth: true,
					changeYear: true
				});
			}
			else{
				//$("#brgy_select").hide();
				$("#brgy_select").hide();
				$("#mun").hide();
				$("#br").hide();
				$("#date").hide();
				$("#search_field").show( 'drop', 500).focus();
			} 
			if(municipality=='municipal'){
				$("#br2").hide();
				$("#brgy_select").hide();
				$("#mun").show();
				$("#br").show();
				
			}
			else if(municipality == 'brgy'){
				$("#search_field").hide();
				$("#mun").hide();
				$("#br").hide();
				
				$.getJSON('Autocom',{transaction:transaction,name:name},function(result){
					//alert(result.list);
					var pval=result.list;
					//var tval=new Array();
					//var str = "<option></option>";
					if(controller == 0){
						var str = "<option></option>";
						controller++;
					}
					else{
						var str = "<option value='"+document.getElementById("brgy_select").value+"'></option>";
					}
					for(var i=0;i<pval.length;i++){
						/* tval[i]=pval[i].brgy_name; */
						str += "<option value='"+pval[i].brgy_id+"' >"+pval[i].brgy_name+"</option>";
					}
					
					document.getElementById("brgy_select").innerHTML = str;
					$("#brgy_select").combobox();
					//$("#brgy_select").show( 'drop', 500).focus();
					$("#br2").show();
					
					/* $("#search_field").autocomplete({
						source:tval
					}); */
				});
				
			}else{
				$("#mun").hide();
				$("#br").hide();
				$("#br2").hide();
			}
		});
		$("#munc").change(function(){
			var municipal=document.getElementById("munc").value;
			xhrGo("GET","ViewBarangy?municipal="+municipal, show, "plain");
		});
		$("#search_btn").button({
			icons : {primary : "ui-icon-search" }
		});

		$("#date").hide();
		$("#household").click(function(){
			$("#date").hide();
			$("#search_field").show();
			$("#br2").hide();
		});
		$("#grantee").click(function(){
			$("#date").hide();
			$("#search_field").show();
			$("#br2").hide();
		});
		$("#wife").click(function(){
			$("#date").hide();
			$("#search_field").show();
			$("#br2").hide();
		});
		$("#student").click(function(){
			$("#date").hide();
			$("#search_field").show();
			$("#br2").hide();
		});
		$("#municipal").click(function(){
			$("#date").hide();
			$("#search_field").hide();
			$("#br2").hide();
		});
		$("#brgy").click(function(){
			$("#date").hide();
			$("#search_field").hide();
		}); 
		$("#phil").click(function(){
			$("#date").hide();
			$("#br2").hide();
			$("#search_field").show();
		});
		$("#birth").click(function(){
			$("#search_field").hide();
			$("#br2").hide();
			$("#date").show();
			$( "#date" ).datepicker({
				changeMonth: true,
				changeYear: true
			});
		});
		//$("html").scrollTop(168);
	});
	function searchByFingerprint(){
			xhrGo("POST","SearchByFingerprint",display, "plain");
	}
	function display(){
		
	}
	function show(data){
		var x=eval('('+data+')');
		var strbuild="";
		strbuild+="<td id='br'>"+
				"<select id='brgay' name='brgy' class='input'>"+
				"<option selected='selected' disabled='disabled' >Barangay</ption>";
		for(var i=0;i<x.data.length;i++){
			strbuild+="<option value='"+x.data[i].brgy_id+"'>"+x.data[i].barangay+"</option>";
		}
			strbuild+="</select>"+
				"</td>";
		document.getElementById("br").innerHTML=strbuild;
	}
	$(function(){
		var dialogSettingsInEdit = {
				autoOpen:false,
				draggable:false,
				hide:'fade',
				show:'fade',
				resizeable:false,
				modal:true,
				width:'600',
				height:'440'
		};
		$("#ADDtransaction").dialog(dialogSettingsInEdit);
		 
	});

	
	
	function AddTransaction(household_id){
	 	$("#ADDtransaction").dialog('open').load('Addtransaction?household_id='+household_id);
	}

	function confirmLogout(distination){
		$( "#dialog-confirm" ).dialog({
			show: "fade",
			hide: "fade",
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"OK": function() {
					$( this ).dialog( "close" );
					document.location.href = distination;
				},
				"Cancel": function() {
					$( this ).dialog( "close" );
				}
			}
		});
	}
	
	function getID(ID){
		return document.getElementById(ID);
	}

	function getIDValue(ID){
		return document.getElementById(ID).value;
	}
	
	/*
	<option selected="selected" value="household" id="household">Search By HouseHold ID NO.</option>
					<option value="grantee" id="grantee">Search By Grantee</option>
					<option value="wife" id="wife">Search By Wife/Spouse</option><!-- 
					<option value="student" id="student">Search By Student</option> -->
					<option value="municipal" id="municipal">Search By Municipality</option>
					<option value="brgy" id="brgy">Search By Barangay</option>
					<option value="birth" id="birth">Search By Birthday</option>
					<option value="phil" id="phil">Search By PhilHealth NO.</option>
	
	
	*/
	
	function changeDivData(){
		var transaction = getIDValue("transaction");
		var val = getIDValue("search_field");
		var munc = getIDValue("munc");
		var brgy = getIDValue("brgay");
		var date = getIDValue("date");  
		var brgy_select;
		
		if(transaction == "brgy"){
			$("#div").show();
			$("#overlay").show();
			brgy_select = getIDValue("brgy_select");
			xhrGo2("POST","FingerPrintSearch?transaction="+transaction+"&val="+val+"&municipal="+munc+"&brgy="+brgy+"&date="+date+"&brgy_select="+brgy_select,displayDivData, "plain");
		}
		else if(transaction == "municipal"){
			$("#div").show();
			$("#overlay").show();
			xhrGo2("POST","FingerPrintSearch?transaction="+transaction+"&val="+val+"&municipal="+munc+"&brgy="+brgy+"&date="+date,displayDivData, "plain");
		}
		else{
			if(val != "" || date != ""){
				$("#div").show();
				$("#overlay").show();
				xhrGo2("POST","FingerPrintSearch?transaction="+transaction+"&val="+val+"&municipal="+munc+"&brgy="+brgy+"&date="+date,displayDivData, "plain");
			}
			else{
				//alert("please enter an input..wag pasaway");
				$( "#warning" ).dialog({
					show: "fade",
					hide: "fade",
					resizable: false,
					height:140,
					modal: true,
					buttons: {
						"OK": function() {
							$( this ).dialog( "close" );
						}
					}
				});
				
			}
		}
		
	}

	
	function displayDivData(data){
		
		var x = eval('('+data+')');
		var str = "";
		var str2 = "<tr><td></td></tr>";
		getID("tbody").innerHTML = str2;
		document.getElementById("date").value = "";
		if(x.data == "" || x.data == "{}" || x.mess == "No Record Found" || x.day == "No Birthdays"){
			getID("tbody").innerHTML = "<tR><th align='center'  colspan='6' ><b  style ='color:red;font-size:23px;'  >No records Found!</b></th></tR>";
			fadeOutLoading();
		}
		else{
			var count = 1;
			for(var i=0;i<x.data.length;i++){
				
				str += "<tr class='tbl_r'>" +
							"<td id='id_cell'>" +count+ "</td>" +
							"<td id='id_cell'>" +x.data[i].household_id+ "</td>" +
							"<td id='id_cell'>" +x.data[i].householdmember_id+ "</td>" +
							"<td id='id_cell'>" +x.data[i].name+ "</td>"+
							"<td class='action' id='id_cell9'><a href='<%=cPath %>/View_transactions2?hh_id="+x.data[i].household_id+"' >ViewProfile</a></td>";
				str += "</tr>";		
				count++;
			}
			
			getID("tbody").innerHTML = str;
			
			 $('tbody1 tr:odd', $('#display')).hide(); //hiding rows for test
			    var options = {
			      currPage : 1, 
			      ignoreRows : $('tbody1 tr:odd', $('#display')),
			      optionsForRows : [10],
			      rowsPerPage : 10,
			      firstArrow : (new Image()).src="<%= cPath %>/images/firstBlue.gif",
			      prevArrow : (new Image()).src="<%= cPath %>/images/prevBlue.gif",
			      lastArrow : (new Image()).src="<%= cPath %>/images/lastBlue.gif",
			      nextArrow : (new Image()).src="<%= cPath %>/images/nextBlue.gif",
			      topNav : false
			    };
			    $('#display').tablePagination(options);
		}
		setTimeout("fadeOutLoading()",1000);
	}
	$(function(){
		$("#tablePagination_firstPage").button({
			icons: {primary: "ui-icon-seek-first"}
		});
		$("#tablePagination_prevPage").button({
			icons: {primary: "ui-icon-seek-prev"}
		});
		
		$("#tablePagination_nextPage").button({
			icons: {secondary: "ui-icon-seek-next"}
		});
		$("#tablePagination_lastPage").button({
			icons: {secondary: "ui-icon-seek-end"}
		});
	});
	

	function checkSubmit(e)
	{
	   if(e && e.keyCode == 13)
	   {
		   changeDivData();
	   }
	}
	
</script>
<style type="text/css"><!--


#munc{
	width:180px;
}
#brgay{
	width:230px;
}

	#display,#display2{
	margin-top:12px;
	border:  1px solid black; ;
	border-collapse: collapse;
	font-size: 13px;
	width: 880px;
}
	
	#main{
		height: 600px;
	}
	.ui-widget{
		font-size: 12px;
	}
/* 	.first, .prev, .next, .last{
	background-color: #58aa00;
    padding: 2px 2px;
    display: inline;
    border: none;
    color: #fff;
    cursor: pointer;
    font-weight: bold;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    text-shadow: 1px 1px #666;
    font-family: helvetica,sans-serif,arial;
    font-size: 14px;
    margin: 3px auto;
	}
	.ui-state-default, .ui-widget-header .ui-state-default{
		background: #58aa00;
	} */
	/*SCROOLL bar  */
	.ui-autocomplete {
		max-height: 150px;
		overflow-y: auto;
		/* prevent horizontal scrollbar */
		overflow-x: hidden;
		/* add padding to account for vertical scrollbar */
		padding-right: 20px;
	}
	h3{
		text-transform: capitalize;
		font-family: sans-serif;
		font-size: 18px;
		letter-spacing: 5px;
		margin-bottom: 3px;
	}
	#tableOne{
		border-collapse: collapse;
	
	}
	
	#table{
		border-collapse: collapse;
	}
	#tabOne{
		border-collapse: collapse;
	}
	#tabTwo{
		border-collapse: collapse;
	}
	#tabThree{
		border-collapse: collapse;
	}
	#table1{
		border-collapse: collapse;
	}
	#table2{
		border-collapse: collapse;
	}
	#table3{
		border-collapse: collapse;
	}
	#table4{
		border-collapse: collapse;
	}
	#table5{
		border-collapse: collapse;
	}
	#table6{
		border-collapse: collapse;
	}
	#table7{
		border-collapse: collapse;
	}
	.input{
		margin-bottom: 5px;
		border: 1px solid #8FA9BC;
		padding: 5px 3px 5px 10px;
		color:#000000;
		outline: none;
	}
	.input:FOCUS{
		border: 1px solid #000045;
		box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
		-webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
		-moz-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
	}
	.input:HOVER{
		border: 1px solid #000886;
	}
	.tbl_r:HOVER {
	background-color: #ddd;
	}
	table {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	margin: 3px 3px;
}
	a{
		text-decoration: none;
	}
	a:HOVER{
		color: red;
		text-decoration: underline;
	}
	#sbf:HOVER {
		text-decoration: none;
	}
	.t{
		padding: 5px 10px;
		width: 150px;
		
	}
	.ft{
		padding:0px auto;
	}
	.tbl_r td{
		padding-left: 5px;
		padding-right: 8px;
		font-size: 16px;
	}
	.t2{
		padding: 5px 10px;
		width: 120px;
	}
	.t3{
		padding: 5px 10px;
		width: 350px;
	}
	td{
		padding:5px 5px 5px;
	}
	.action{
		width: 10px;
		padding: 0 5px 0 5px;
	}
	
	
#display th,#display2 th{
	padding-left: 5px;
	padding-right: 5px;
}

 #tablePagination { 
            font-size: 10px; 
            padding: 0px 5px; 
            height: 40px;
            width: 868px;
            border:  1px solid black; ;
            border-collapse: collapse;
            border-top: none;
            padding-top: 10px;
}
          
 #tablePagination_nextPage,#tablePagination_firstPage,#tablePagination_prevPage{
 	padding-left: 5px;
 	margin-left: 5px;
 }
#tablePagination_lastPage{
	padding-left: 5px;
	margin-left: 10px;
}
#tablePagination_prevPage{
	margin-right: 5px;
}

	
.overlay{
	height: 100%;
	width: 100%;
	padding: 0;
	top: 0;
	bottom: 0;
	left:0;
	background-color: black;
	opacity: .85;
	z-index: 900;
	-moz-opacity: .85;
	display: block;
	position: fixed;
	filter: alpha(opacity=1000);
	
}	
	
.load{
	/* margin-top: -450px; */
	z-index: 1000;
	right: 50%;
	position: fixed;
	top: 30%;
	background-position: center;
	color: red;
}	

 #display thead{
	color:black;
	background-color: lightblue;
}

	
</style>
</head>
<%
	SimpleDateFormat dateSDF = new	SimpleDateFormat("MMMM dd,yyyy");
	SimpleDateFormat dw = new SimpleDateFormat("EEEE");
 	Calendar s = Calendar.getInstance();
	Date today = s.getTime();
	String sDate = dateSDF.format(today);
	String Dw = dw.format(today);
%>
<body onload="updateClock(); setInterval('updateClock()', 1000 )">
<div id="page-wrap">
<div id="header" >
<div id="logo" >
	<img id="logo_image" alt="" src="<%=cPath %>/logos/headers-mag.jpg">
	<div id="display-login"> Login as <c:out value="${duser_rolename }"></c:out>(<c:out value="${dfname }"></c:out>) </div>
</div><!-- End of Logo -->
</div><!-- End of Header -->
<div id="main-content">

<div id="menu">

<jsp:include page="../home/menu.jsp"></jsp:include>

</div>
<div id="displayTD">
<table id="tbl">
	<tr> <td><input checked="checked" onclick="hide();" id="hide" type="checkbox"/> Keep this date & time in view</td> </tr>
 	<tr>
 		<td class="day"><%if(Dw.equals("Sunday")){%> <font id="sun"><% out.println(Dw); %>,</font> 
						  <%}else{%> <font class="mon-sat"><% out.println(Dw); %>,</font><% } %>
		<!-- </td>
 		<td class="timeDate"> --><font class="mon-sat"><% out.println(sDate); %></font><!-- <hr> --></td></tr><!--displaying Date[jm]  -->
	<tr><td class="timeDate"> <span id="clock">&nbsp;</span><!-- <hr> --> </td></tr><!--displaying Time[jm]  -->
	</table>		 
</div>
<div id="main">
<div>
<h3 align="center" >Members Without Fingerprint</h3>
<div align="center">

	<table id="tab">
		<tr>
			<td><label for="transaction"><select name="transaction" id="transaction" class="input">
					<option selected="selected" value="household" id="household">Search By HouseHold ID NO.</option>
					<option value="grantee" id="grantee">Search By Grantee</option>
					<option value="wife" id="wife">Search By Wife/Spouse</option><!-- 
					<option value="student" id="student">Search By Student</option> -->
					<option value="municipal" id="municipal">Search By Municipality</option>
					<option value="brgy" id="brgy">Search By Barangay</option>
					<option value="birth" id="birth">Search By Birthday</option>
					<option value="phil" id="phil">Search By PhilHealth NO.</option>
				</select></label>
			</td>
			<td id="mun"><select name="municipal" id="munc" class="input">
							<option selected="selected" disabled="disabled" >Municipality</option>
							<c:forEach items="${municipal_list}" var="list">
								<option value="${list.mun_id}" ><c:out value="${list.municipal}"></c:out></option>
							</c:forEach>
						</select>
			</td>
			<td id="br"><select name="brgy" id="brgay" class="input">
						<option selected="selected" disabled="disabled">Barangay</option>
					</select>
			</td>
			<td id="br2" >
				<select id='brgy_select' name='brgy_select' >
					
				</select>
			</td>
			<td><label for="search_field"><input name="val" onKeyPress="return checkSubmit(event)" class="input" id="search_field" size="35" autocomplete="off">
			<input name="date" class="input" id="date"></label></td>
			<td><button onclick="changeDivData();" id="search_btn">Search</button> </td>
		</tr>
	</table>

</div>

<div id="ADDtransaction" style="display: none;" title="Add Transaction"></div>

<div id="mess" align="center">
<c:if test="${mess=='No Record Found'}">
	<h1>No Records Found</h1>
</c:if>
<c:if test="${day=='No Birthdays'}">
	<h1>No Records found on that birthday.</h1>
</c:if>
</div>
<div align="center" id="message"></div>

<div id="if5" align="center">

	<table align="center" id="display" class="paginated display sortable"  border="1" cellpadding="5px">
		<thead>
		<tr>
			<th class="ft">#</th>
			<th class="t">Household ID NO.</th>
			<th class="t2">Household Member ID NO.</th>
			<th class="t3">Name of Head</th>
			<th colspan="2" align="center" class="t2">Action</th>
		</tr>
		</thead>
		<tbody id="tbody" >
			<%-- <c:forEach items="${householdlist}" var="list">
				<tr class="tbl_r">
					<td><c:out value="${list.household_id}"></c:out></td>
					<td><c:out value="${list.householdmember_id}"></c:out></td>
					<td><c:out value="${list.name}"></c:out></td>
					<td class="action" ><a href="<%=cPath %>/View_transactions2?hh_id=${list.household_id}">ViewProfile</a></td>
				</tr>
			</c:forEach> --%>
		</tbody>
		<tfoot id="tfoot" align="center">
			<!-- <tr id="pager4">
				 <td colspan="4" style="border-right: solid 3px #7f7f7f;">
				<input type="button" class="first" value="First" />
				 <input type="button" class="prev" value="Prev" />
				 <input readonly="readonly" size="3" type="text" id="pager" class="pagedisplay" value="first" />
				 <input type="button" class="next" value="Next" />
				 <input type="button" class="last" value="Last" />
				 <select class="pagesize">
					<option selected="selected"  value="10">10</option>
				</select>
				</td>
			</tr> -->
		</tfoot>
	</table>

</div>

</div>

</div>
</div> <!-- end of main content -->
<div id="dialog-confirm" title="Logout" style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Are you sure you want to logout ?</p>
</div>
<div id="warning" title="Warning!" style="display: none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>No input to be search. Please fill up the field.</p>
</div>
</div> <!-- end of page wrap -->

<div class="overlay" id="overlay"></div>
		<div id="div" class="load">
			<img alt="" src="<%=cPath %>/images/loading_transparent.gif"><br>
		</div>

</body>
</html>