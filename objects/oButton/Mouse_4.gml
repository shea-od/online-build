if (txt == "create server"){
    with(oButton){instance_destroy()};
    instance_create(0,0,oServer);
}else{
    with(oButton){instance_destroy()};
    instance_create(0,0,oClient);
    instance_create(100,100,oPlayer);
}

