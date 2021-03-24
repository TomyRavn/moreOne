const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColor");
const range = document.getElementById("jsRange");
const mode = document.getElementById("jsMode");
const saveBtn = document.getElementById("jsSave");

const INITIAL_COLOR = "#2c2c2c";

//Specify the width & height of pexel modifier for canvas pixel control(not the same concept with css width & height)
canvas.width = canvas.offsetWidth;
canvas.height = canvas.offsetHeight;

//Set background-color white(default : transparent)
// ctx.fillStyle = "white";
// ctx.fillRect(0, 0, canvas.width, canvas.height);

ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = 2.5;

let painting = false;
let filling = false;

function stopPainting(){
    painting = false;
}

function startPainting(){
    painting = true;
}

function onMouseMove(event){
    let x = event.offsetX;
    let y = event.offsetY;

    if(!painting){
        ctx.beginPath();    //새 경로 좌표 생성
    }else{
        ctx.lineTo(x, y);   //선 끝 좌표 지정
        ctx.stroke();       //선 그리기
    }
}

function onMouseEnter(event){
    x = event.offsetX;
    y = event.offsetY;

    ctx.moveTo(x, y);
}

function handleColorClick(event){
    const color = event.target.style.backgroundColor;
    ctx.strokeStyle = color;
    ctx.fillStyle = color;
}

function handleRangeChange(event){
    const size = event.target.value;
    ctx.lineWidth = size * 2;
}

function handleModeClick(){
    if(filling == true){
        filling = false;
        mode.innerText = "Fill";
    }else{
        filling = true;
        mode.innerText = "Paint";
    }
}

function handleCanvasClick(){
    if(filling) ctx.fillRect(0, 0, canvas.width, canvas.height);
}

function handleSaveClick(){
    const image = canvas.toDataURL("image/png");
    const link = document.createElement("a");
    link.href = image;
    link.download = "PaintJS[🎨]";
    link.click();
}

//prevent mouse right-button click event function
// function handleCM(event){
//     event.preventDefault();
// }

if(canvas){
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    document.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseenter", onMouseEnter);
    canvas.addEventListener("click", handleCanvasClick);

    //mouse right-button click event listener
    // canvas.addEventListener("contextmenu", handleCM);
}

//Array.from => create Array from object
// console.log(Array.from(colors));
Array.from(colors).forEach(color => color.addEventListener("click", handleColorClick));

if(range){
    range.addEventListener("input", handleRangeChange);
}

if(mode){
    mode.addEventListener("click", handleModeClick);
}

if(saveBtn){
    saveBtn.addEventListener("click", handleSaveClick);
}