const weather = document.querySelector(".js-weather");

const API_KEY = "88472f96289077665c286e004575c722";
const COORDS = 'coords';

function getWeather(lat, lng){
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${API_KEY}&units=metric`).then(
        function(response){
            return response.json();
        }
    ).then(
        function(json){
            const temperature = json.main.temp;
            const place = json.name;
            weather.innerText = `${temperature} @ ${place}`;
        }
    );
}

function saveCoords(coordsObj){
    localStorage.setItem(COORDS, JSON.stringify(coordsObj));
}

function handleGeoSuccess(position){
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const coordsObj = {
        latitude,
        longitude
        //key 명칭과 value 명칭이 같을 때는 위와 같이 생략 가능
        // latitude: latitude,
        // longitude: longitude
    };
    saveCoords(coordsObj);
    getWeather(latitude, longitude);
}

function handleGeoError(){
    console.log(`Can't access geo location`);
}

function askForCoords(){
    navigator.geolocation.getCurrentPosition(handleGeoSuccess, handleGeoError);
}

function loadCoords(){
    const loadedCords = localStorage.getItem(COORDS);

    if(loadedCords == null){
        askForCoords();
    }else{
        //getWeather
        const parsedCoords = JSON.parse(loadedCords);
        getWeather(parsedCoords.latitude, parsedCoords.longitude);
    }
}

function init(){
    loadCoords();
}

init();