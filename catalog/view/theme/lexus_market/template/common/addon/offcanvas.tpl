<div class="sidebar-offcanvas sidebar visible-xs visible-sm">
      <div class="offcanvas-inner  panel-offcanvas">
          <div class="offcanvas-heading panel-heading">
              <button data-toggle="offcanvas" class="btn btn-default" type="button"> <span class="fa fa-times"></span></button>
          </div>
          <div class="offcanvas-body ">
                <div id="offcanvasmenu"></div> 
          </div>
          <div class="offcanvas-footer panel-footer">
              <div class="input-group" id="offcanvas-search">
                <input type="text" class="form-control" placeholder="Search" value="" name="search">
                <span class="input-group-btn">
                  <button class="button" type="button"><i class="fa fa-search"></i></button>
                </span>
              </div>
          </div>
       </div> 
 </div>

<script type="text/javascript">
  $("#offcanvasmenu").html($("#bs-megamenu").html());
</script>
