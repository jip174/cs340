function deleteemployee(id){
    $.ajax({
        url: '/employee/' +id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};