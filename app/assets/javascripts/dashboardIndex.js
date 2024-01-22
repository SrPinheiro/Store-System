let dateObject = document.getElementById("dateInformation")

const updateHour = () => {
    if(dateObject){
        const date = new Date
        const formatNumber = (number) => number > 9 ? number : "0".concat(number)
        const day = formatNumber(date.getDate())
        const month = formatNumber(date.getMonth() + 1)
        const year = formatNumber(date.getFullYear())
        const hour = formatNumber(date.getHours())
        const minute = formatNumber(date.getMinutes())
        const dateString = `${day}/${month}/${year} ${hour}:${minute}`
        
        if (dateObject.textContent !== dateString){
            dateObject.textContent = dateString
        }
    }else{
        dateObject = document.getElementById("dateInformation")
    }
}

updateHour()
const intervalId = setInterval(updateHour, 5000)
