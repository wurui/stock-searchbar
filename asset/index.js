define(['oxjs'],function(OXJS){
  return {
    init:function($mod){
    	var TO,
            searchInput=$('input',$mod).on('keyup focus',function(){
                if(TO)clearTimeout(TO);
                TO=setTimeout(function(){
                	var val=$.trim(searchInput.val())
                    $mod.OXRefresh({
                        'stock-analysis':{
                            symbol:{$contains:'^'+val}
                        }
                    });
                    val?sugguest.show():sugguest.hide();
                },300)
            }).on('blur',function(){
                sugguest.hide()
            }),

    		sugguest=$('.J_suggest',$mod).css({
                width:searchInput.width()

            }).hide().on('tap','li',function(){
				var new_symbol=$.trim(this.innerHTML);
				searchInput.val(new_symbol).blur();
				$mod.OXPost({
					$fav:{
						'stock-analysis':{
						    symbol:new_symbol
						}

					}
					
				})

            });

    }
  }
})
