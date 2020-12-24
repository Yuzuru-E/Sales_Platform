
$(function() {
    $('input[name="catItems[]"]').on('change', function() {   
      var catItems = [];    
      $('input[name="catItems[]"]:checked').each(function() {
        catItems.push('<li class="tag-item">' + $(this).val() + '<span class="close"></span></li>');            
      });
      
      $('ul.tag-list').html(catItems);
  
      $('.tag-item').on('click', function(){
        $(this).remove();
  
        var text = $(this).text();
        $('.list-options input[value=' + text + ']').prop( 'checked', false );
          
      });
      
    });
    
    $('#clear').on('click', function() {
      if($("input:checkbox[name='catItems[]']").prop( 'checked', false )){
        
        $("input:checkbox[name='catItems[]']").prop( 'checked', false );
        $('ul.tag-list').html('');
        
      }
      return false;
    });
    
  });
  
  
  Resources1×0.5×0.25×Rerun