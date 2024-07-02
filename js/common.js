function loadComponent(componentId, filePath) {
    fetch(filePath)
        .then(response => response.text())
        .then(data => {
            document.getElementById(componentId).innerHTML = data;
        });
}

document.addEventListener("DOMContentLoaded", function() {
    loadComponent('header', 'components/header.html');
    loadComponent('sidebar', 'components/sidebar.html');
    loadComponent('footer', 'components/footer.html');
});

