<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
    <head>
        <style>
            .div{
                width: 158px; height: 204px; float: left;
                background-color: #eea813;
                text-align: center;
                margin-left: 20px;
            }
            .res{
                margin-top: 30px;
            }
            #d3{
                font-size: 1.5em;
                
            }
            
            .shake {
  				display: inherit;
  				transform-origin: center center; 
  			}

			.shake-freeze,
			.shake-constant.shake-constant--hover:hover,
			.shake-trigger:hover .shake-constant.shake-constant--hover {
				animation-play-state: paused; 
			}

			.shake-freeze:hover,
			.shake-trigger:hover .shake-freeze, .shake:hover,
			.shake-trigger:hover .shake, {
				animation-play-state: running; 
			}

@keyframes shake {
  2% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  4% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  6% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  8% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  10% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  12% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  14% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  16% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  18% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  20% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  22% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  24% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  26% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  28% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  30% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  32% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  34% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  36% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  38% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  40% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  42% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  44% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  46% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  48% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  50% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  52% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  54% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  56% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  58% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  60% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  62% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  64% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  66% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  68% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  70% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  72% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  74% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  76% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  78% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  80% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  82% {
    transform: translate(1px, 0px) rotate(0.5deg); }
  84% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  86% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  88% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  90% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  92% {
    transform: translate(0px, 1px) rotate(0.5deg); }
  94% {
    transform: translate(0px, 0px) rotate(0.5deg); }
  96% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  98% {
    transform: translate(1px, 1px) rotate(0.5deg); }
  0%, 100% {
    transform: translate(0, 0) rotate(0); } }

	.shake-little:hover, .shake-trigger:hover .shake-little, .shake-little.shake-freeze, .shake-little.shake-constant {
  		animation-name: shake-little;
  		animation-duration: 100ms;
  		animation-timing-function: ease-in-out;
  		animation-iteration-count: infinite; 
  	}
        </style>
        <script>
            function onDragStart(target,e){
                e.dataTransfer.setData("text",target.id); 
            }
            var num=1;
            function onDrop(target,e){
            	console.log("1111");
                var id = e.dataTransfer.getData('Text');
                //target.appendChild(document.getElementById(id)); 
                d2ChildElement(target);
                e.preventDefault(); 
              
            }
            var yum="";
            function d2ChildElement(target){
				
           }
        </script>

    </head>
    <body>
        <div>Drag & Drop 02 예제</div>
        <div id="d1" class="div" ondragenter="return false;" 
             ondragover="return false;" ondrop="onDrop(this,event)">
             <c:url value="/static/images/header-logo.jpg" var="logo"/>
            <img src="${logo }"  id="rabbit1"   draggable="true" 
                 ondragstart="onDragStart(this,event)" />
        </div>
        <div id="d2" class="div shake"  ondragenter="return false;" 
             ondragover="return false;" ondrop="onDrop(this,event)">
        </div>
        <div id="d3" class="div"></div>
    </body>
</html>