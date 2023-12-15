function guardarCambios() {
    // ... Tu código JavaScript existente ...

    fetch('{{ route("odontograma.guardar") }}', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log('Cambios guardados exitosamente');
            // Aquí puedes mostrar un mensaje de éxito en la página
        }
    })
    .catch((error) => {
        console.error('Error:', error);
    });




    
}


