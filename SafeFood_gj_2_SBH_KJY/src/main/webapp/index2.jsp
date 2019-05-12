<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
    <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
            
.shake{
	animation-name: shake;
	animation-duration: 10ms;
	animation-timing-function: ease-in-out;
	animation-iteration-count: infinite; 
}

@keyframes shake {
  2% {
    transform: translate(0.5px, -0.5px) rotate(0.5deg); }
  4% {
    transform: translate(2.5px, 1.5px) rotate(1.5deg); }
  6% {
    transform: translate(2.5px, 0.5px) rotate(0.5deg); }
  8% {
    transform: translate(0.5px, -0.5px) rotate(0.5deg); }
  10% {
    transform: translate(-0.5px, -1.5px) rotate(1.5deg); }
  12% {
    transform: translate(-0.5px, 0.5px) rotate(1.5deg); }
  14% {
    transform: translate(-1.5px, 1.5px) rotate(1.5deg); }
  16% {
    transform: translate(2.5px, 1.5px) rotate(1.5deg); }
  18% {
    transform: translate(0.5px, -0.5px) rotate(-0.5deg); }
  20% {
    transform: translate(0.5px, 1.5px) rotate(0.5deg); }
  22% {
    transform: translate(2.5px, -0.5px) rotate(0.5deg); }
  24% {
    transform: translate(-0.5px, 0.5px) rotate(1.5deg); }
  26% {
    transform: translate(-1.5px, 0.5px) rotate(1.5deg); }
  28% {
    transform: translate(0.5px, 0.5px) rotate(-0.5deg); }
  30% {
    transform: translate(1.5px, 1.5px) rotate(1.5deg); }
  32% {
    transform: translate(0.5px, 0.5px) rotate(0.5deg); }
  34% {
    transform: translate(1.5px, -1.5px) rotate(-0.5deg); }
  36% {
    transform: translate(1.5px, 2.5px) rotate(1.5deg); }
  38% {
    transform: translate(-1.5px, 0.5px) rotate(-0.5deg); }
  40% {
    transform: translate(0.5px, -0.5px) rotate(1.5deg); }
  42% {
    transform: translate(2.5px, -1.5px) rotate(-0.5deg); }
  44% {
    transform: translate(-1.5px, -1.5px) rotate(0.5deg); }
  46% {
    transform: translate(1.5px, 0.5px) rotate(0.5deg); }
  48% {
    transform: translate(0.5px, -0.5px) rotate(-0.5deg); }
  50% {
    transform: translate(0.5px, 1.5px) rotate(0.5deg); }
  52% {
    transform: translate(0.5px, -0.5px) rotate(0.5deg); }
  54% {
    transform: translate(2.5px, 0.5px) rotate(1.5deg); }
  56% {
    transform: translate(-1.5px, -1.5px) rotate(0.5deg); }
  58% {
    transform: translate(-1.5px, -0.5px) rotate(-0.5deg); }
  60% {
    transform: translate(0.5px, -1.5px) rotate(0.5deg); }
  62% {
    transform: translate(1.5px, 1.5px) rotate(0.5deg); }
  64% {
    transform: translate(0.5px, 2.5px) rotate(0.5deg); }
  66% {
    transform: translate(0.5px, 0.5px) rotate(1.5deg); }
  68% {
    transform: translate(-1.5px, 2.5px) rotate(0.5deg); }
  70% {
    transform: translate(-1.5px, 1.5px) rotate(1.5deg); }
  72% {
    transform: translate(-0.5px, 2.5px) rotate(1.5deg); }
  74% {
    transform: translate(1.5px, 2.5px) rotate(-0.5deg); }
  76% {
    transform: translate(-0.5px, 0.5px) rotate(1.5deg); }
  78% {
    transform: translate(1.5px, -1.5px) rotate(0.5deg); }
  80% {
    transform: translate(-0.5px, 2.5px) rotate(0.5deg); }
  82% {
    transform: translate(-1.5px, -1.5px) rotate(1.5deg); }
  84% {
    transform: translate(1.5px, 1.5px) rotate(0.5deg); }
  86% {
    transform: translate(0.5px, -0.5px) rotate(-0.5deg); }
  88% {
    transform: translate(-1.5px, 2.5px) rotate(-0.5deg); }
  90% {
    transform: translate(1.5px, 0.5px) rotate(0.5deg); }
  92% {
    transform: translate(0.5px, -1.5px) rotate(0.5deg); }
  94% {
    transform: translate(0.5px, -1.5px) rotate(1.5deg); }
  96% {
    transform: translate(0.5px, 1.5px) rotate(-0.5deg); }
  98% {
    transform: translate(-0.5px, -0.5px) rotate(0.5deg); }
  0%, 100% {
    transform: translate(0, 0) rotate(0); } }


        </style>
        <script>
            function onDragStart(target,e){
                e.dataTransfer.setData("text",target.id); 
            }
            function onDrop(target,e){
                var id = e.dataTransfer.getData('Text');
            	console.log(id);
            	
            	target.classList.add('shake');
            	setTimeout(function() {
            		target.classList.remove('shake');
           		}, 500);
                e.preventDefault(); 
              
            }
            function drag(ev) {
                $('#drag1').css('cursor', 'pointer');
            }
        </script>

    </head>
    <body>
        <c:url value="/static/images/header-logo.jpg" var="logo"/>
        <c:url value="/static/images/basket.png" var="basket"/>
    	<img id="drag1" class="drag" src="${logo }" draggable="true" ondragstart="drag(event)" />
        <div>
        	<img src="${basket }"  id="d2" ondragenter="return false;" 
             ondragover="return false;" ondrop="onDrop(this,event)"/>
        </div>
        <div id="d3" class="div">
        	<img src="${logo }"  id="rabbit2" draggable="true" 
                 ondragstart="onDragStart(this,event)" />
        </div>
    </body>
</html>