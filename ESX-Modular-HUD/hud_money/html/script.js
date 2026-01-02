window.addEventListener('message', function(event) {
    // Mise à jour de l'argent
    if (event.data.action === 'updateMoney') {
        document.getElementById('money').textContent = event.data.money.toLocaleString() + "€";
        document.getElementById('black').textContent = event.data.black.toLocaleString() + "€";
        document.getElementById('bank').textContent = event.data.bank.toLocaleString() + "€";
    }

    // Mise à jour du job
    if (event.data.action === 'updateJob') {
        document.getElementById('jobLabel').textContent = event.data.jobLabel || "Aucun";
        document.getElementById('jobGrade').textContent = event.data.jobGrade || "0";
    }
});
