function populateGallery(title, img, id){
    document.getElementById("cardcontainer").insertAdjacentHTML("beforeend",
    `
        <div id="photo-${id}" class="item" onclick="fadeout('photo-${id}')">
        <img src="${img}" alt="${title}" id="${id}" class="images">
        <p>Author: dairyQueen</p>
        <p>Title:</p>
        <p class="img-desc">${title}</p>
        </div> 
    `
    );
}

async function loadPictures(){
     try{
        var response = await axios.get('https://jsonplaceholder.typicode.com/albums/2/photos'); //grabs API  
        size = response.data.length;
        displayCount(size);
        response.data.forEach(element => {
            populateGallery(element.title, element.thumbnailUrl, element.id);

        });
     }
     catch(err){
        console.log(err);
     }
}
loadPictures();

function displayCount(size){
    document.getElementById("count").innerHTML=`<p>${size} images</p>`
}


function fadeout(id){
    var fadeTarget = document.getElementById(`${id}`);
    var fadeEffect = setInterval(function(){
        if(!fadeTarget.style.opacity){
            fadeTarget.style.opacity = 1;
        }
        if(fadeTarget.style.opacity > 0){
            fadeTarget.style.opacity -=0.6;
        }
        else{
            clearInterval(fadeEffect);
            remove(`${id}`);
            displayCount(--size);
        }
    }, 200); 
}
function remove(id){
    var removediv = document.getElementById(`${id}`);
    removediv.parentNode.removeChild(removediv);
}
