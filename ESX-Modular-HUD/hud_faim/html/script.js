window.addEventListener('message', function(event){
    if(event.data.action === 'update'){
        document.getElementById('hungerValue').textContent = Math.max(0, Math.min(100, event.data.hunger)).toFixed(0);
        document.getElementById('thirstValue').textContent = Math.max(0, Math.min(100, event.data.thirst)).toFixed(0);
    }
});
