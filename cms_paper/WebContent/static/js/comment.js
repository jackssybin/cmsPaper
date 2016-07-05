/**
 * Created by yaq on 2016/4/15.
 */
//加入购物车
function addToCart(goodsId,parentId,is_ajax){
    var goods=new Object();
    var spec_arr=new Array();
    var fittings_arr=new Array();
    var number=1;//用户选择的商品的数量，找到商品数量的输入框的value();
    var formBuy = document.forms['ECS_FORMBUY'];
    var quick = 0;
    var goods_sn = document.forms['ECS_FORMBUY'];

// 检查是否有商品规
    if (formBuy){
        spec_arr = getSelectedAttributes(formBuy);

        if (formBuy.elements['number']){
            number = formBuy.elements['number'].value;
        }

        quick = 1;
    }

    goods.quick = quick;
    goods.spec = spec_arr;
    goods.goods_id = goodsId;
    goods.number = number;
    goods.parent = (typeof(parentId) == "undefined") ? 0 : parseInt(parentId);
    goods.goods_sn = goods_sn;
    Ajax.call('flow.php?step=add_to_cart', 'goods=' + goods.toJSONString(), addToCartResponse, 'POST', 'JSON');

}