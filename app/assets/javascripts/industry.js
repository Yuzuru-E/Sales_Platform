$(document).on('turbolinks:load',function(){
  function appendOption(industry){
    var html = `<option value="${industry.id}" data-industry="${industry.id}">${industry.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='industryForm__wrapper__added' id= 'children_wrapper'>
                        <div class='industryForm__wrapperBox new__all-box'>
                          <label for="child_industry" class="edit__item col-5">経験業界</label>
                          <select class="industryForm__wrapperBox--select new__all__text-field" id="child_industry" >
                            <option value="選択してください" data-industry="選択してください">選択してください</option>  
                            ${insertHTML}
                          </select>  
                        </div>
                      </div>`;
    $('.industryForm__box').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='industryForm__wrapper__added' id= 'grandchildren_wrapper'>
                              <div class='industryForm__wrapperBox new__all-box'>
                                <label for="grandchild_industry" class="edit__item col-5">営業手法</label>
                                <select class="industryForm__wrapperBox--select new__all__text-field" id="grandchild_industry" name="user[industry_id]">
                                  <option value="---" data-industry="---">選択してください</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.industryForm__box').append(grandchildSelectHtml);
  }
  $('#parent_industry').on('change', function(){
    var parentIndustry = document.getElementById('parent_industry').value; 
    if (parentIndustry != "選択してください"){
      $.ajax({
        url: 'get_industry_children',
        type: 'GET',
        data: { parent_id: parentIndustry },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    if (parentIndustry = "選択してください"){
      $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
    };
  });

  $('.industryForm__box').on('change', '#child_industry', function(){
    var childId = $('#child_industry option:selected').data('industry'); 
    if (childId != "選択してください"){ 
      $.ajax({
        url: 'get_industry_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); 
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); 
    }
  });
});
