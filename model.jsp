<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="jspName" value='${requestScope["outputObject"].get("contentJspName")}' />
<c:set var="userName" value='${requestScope["outputObject"].get("userName")}' />
<c:set var="elementsDB" value='${requestScope["outputObject"].get("elementsDB")}' />

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${projectName}</title>
  <link rel="icon" href="https://img.icons8.com/emoji/48/000000/cloud-emoji.png" type="image/png" sizes="16x16">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Core CSS -->
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="css/site.css">
  <link rel="stylesheet" href="css/richtext.min.css">
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <style>
    .date_field {position: relative; z-index:1000;}
    .ui-datepicker{position: relative; z-index:1000!important;}
  </style>

  <!-- 🌟 GOLD + GREY THEME STYLES -->
  <style>
    :root {
      --primary-color: #d4af37; /* gold */
      --primary-dark: #b89122;
      --secondary-color: #6c757d; /* neutral grey */
      --background-color: #f7f7f7;
      --text-color: #212529;
      --navbar-bg: #ffffff;
      --sidebar-bg: #2f2f2f;
      --sidebar-text: #f1f1f1;
      --sidebar-hover: #d4af37;
    }

    body {
      background-color: var(--background-color);
      color: var(--text-color);
      font-family: "Segoe UI", sans-serif;
    }

    /* NAVBAR */
    .main-header.navbar {
      background-color: var(--navbar-bg) !important;
      border-bottom: 2px solid var(--primary-color);
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
    }

    .main-header .nav-link {
      color: var(--text-color) !important;
      font-weight: 600;
      transition: color 0.2s ease;
    }

    .main-header .nav-link:hover {
      color: var(--primary-dark) !important;
    }

    /* SIDEBAR */
    .main-sidebar {
      background-color: var(--sidebar-bg) !important;
    }

    .sidebar .nav-link {
      color: var(--sidebar-text) !important;
      transition: all 0.2s ease;
    }

    .sidebar .nav-link.active,
    .sidebar .nav-link:hover {
      background-color: rgba(212, 175, 55, 0.15);
      border-left: 3px solid var(--sidebar-hover);
      color: var(--sidebar-hover) !important;
    }

    .nav-sidebar .nav-item > .nav-link p {
      color: var(--sidebar-text);
    }

    .nav-sidebar .nav-item > .nav-link p:hover {
      color: var(--sidebar-hover);
    }

    /* USER PANEL */
    .user-panel .info a {
      color: var(--sidebar-text) !important;
      font-weight: 600;
    }

    /* CONTENT AREA */
    .content-wrapper {
      background-color: var(--background-color) !important;
    }

    /* TABLES */
    table {
      background-color: #fff;
      border: 1px solid #ddd;
    }

    th {
      background-color: var(--primary-color);
      color: #fff;
      text-align: center;
    }

    td {
      color: #333;
    }

    /* BUTTONS */
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }

    .btn-primary:hover {
      background-color: var(--primary-dark);
      border-color: var(--primary-dark);
    }

    /* MODALS */
    .modal-content {
      border-radius: 10px;
      border: 2px solid var(--primary-color);
    }

    .modal-footer .btn-danger {
      background-color: var(--secondary-color);
      border: none;
    }

    .modal-footer .btn-danger:hover {
      background-color: var(--primary-dark);
    }

    /* SIDEBAR SEARCH */
    .form-control-sidebar {
      background-color: #3b3b3b !important;
      color: #fff !important;
      border: 1px solid #555;
    }

    .form-control-sidebar::placeholder {
      color: #bbb;
    }

    .btn-sidebar {
      background-color: var(--primary-color);
      border: none;
      color: #fff;
    }

    .btn-sidebar:hover {
      background-color: var(--primary-dark);
    }

    /* TITLE */
    #divTitle {
      color: var(--primary-dark);
      font-size: 1.2rem;
      font-weight: 700;
    }

    *:focus {
      outline: none !important;
      box-shadow: 0 0 0 2px rgba(212, 175, 55, 0.3);
    }
  </style>
</head>

<body class="hold-transition sidebar-mini sidebar-expand layout-fixed">
<div class="wrapper">

  <!-- NAVBAR -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button">
          <i class="fas fa-bars"></i>
        </a>
      </li>
    </ul>

    <div class="row" style="width:-webkit-fill-available" align="center">
      <div class="col-12"><div id="divTitle"></div></div>
    </div>

    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a href="?a=showHomePage" class="nav-link"><strong>Home</strong></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <strong>${userdetails.username}</strong>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
          <a class="dropdown-item"><strong>Valid Till (${userdetails.validTillDDMMYYY})</strong></a>
          <a href="?a=showChangePassword" class="dropdown-item"><strong>Change Password</strong></a>
          <a href="?a=showShortcuts" class="dropdown-item"><strong>Shortcuts</strong></a>
          <a href="javascript:logout();" class="dropdown-item" id="refLogout">
            <div class="dropdown-divider"></div>
            <strong>Logout</strong>
          </a>
        </div>
      </li>
    </ul>
  </nav>

  <!-- SIDEBAR -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">
            ${userdetails.username}<br>(${userdetails.firm_name}${userdetails.store_name})
          </a>
        </div>
      </div>

      <div class="form-inline sidebar-search-open">
        <div class="input-group">
          <input class="form-control form-control-sidebar" id="txtseachsidebar"
                 onkeyup="searchElement(this)" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar"><i class="fas fa-fw fa-search"></i></button>
          </div>
        </div>
      </div>

      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <c:forEach items="${elementsDB}" var="item">
            <li class="nav-item has-treeview" name="listItemParentElements" id="${item.getElementName()}">
              <a href="#" name="anchorParentElement" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>${item.getElementName()}<i class="right fas fa-angle-left"></i></p>
              </a>
              <ul class="nav nav-treeview">
                <c:forEach items="${item.getChildElements()}" var="item1">
                  <li id="${item1.getElementName()}" class="nav-item">
                    <a href="${item1.getElementUrl()}" class="nav-link">
                      <i class="nav-icon fas fa-edit"></i>
                      <p>${item1.getElementName()}</p>
                    </a>
                  </li>
                </c:forEach>
              </ul>
            </li>
          </c:forEach>
        </ul>
      </nav>
    </div>
  </aside>

  <!-- CONTENT WRAPPER -->
  <div class="content-wrapper">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <jsp:include page="${jspName}"/>
          </div>
        </div>
      </div>
    </section>
  </div>

  <aside class="control-sidebar control-sidebar-dark"></aside>
</div>

<!-- MODAL -->
<div class="container">
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg" style="min-width:100%">
      <div class="modal-content">
        <div class="modal-body" align="center">
          <p id="responseText"><div align="center" class="loader" id="loader"></div></p>
        </div>
        <div class="modal-footer" style="text-align:-webkit-right">
          <button id="closebutton" type="button" onclick='location.reload()'
                  class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- JS Dependencies -->
<script src="js/common.js"></script>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="plugins/toastr/toastr.min.js"></script>
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>

<!-- Existing Script Logic -->
<script>
  function logout() {
    document.getElementById("closebutton").style.display='none';
    $('#myModal').modal({backdrop: 'static', keyboard: false});
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (xhttp.readyState == 4 && xhttp.status == 200) {
        document.getElementById("loader").style.display='none';
        document.getElementById("responseText").innerHTML = xhttp.responseText;
        document.getElementById("closebutton").style.display='block';
        $('#myModal').modal({backdrop: 'static', keyboard: false});
        window.location.reload();
      }
    };
    xhttp.open("GET", "?a=Logout", true);
    xhttp.send();
  }

  $(document).ready(function () {
    window.onkeydown = function(evt) {
      if (evt.keyCode == 119) logout();
    };
  });

  document.addEventListener("DOMContentLoaded", function () {
  // example condition
  var showSidebar = false; // set true/false dynamically

  const sidebar = document.querySelector(".main-sidebar");
  const contentWrapper = document.querySelector(".content-wrapper");
  const toggleButton = document.querySelector('[data-widget="pushmenu"]');

  if (!showSidebar) {
    // hide sidebar
    if (sidebar) sidebar.remove();
    if (contentWrapper) contentWrapper.style.marginLeft = "0";

    // hide hamburger icon
    if (toggleButton) toggleButton.style.display = "none";

    // optional: switch to top-nav layout if you prefer that spacing
    document.body.classList.remove("sidebar-mini", "layout-fixed");
    document.body.classList.add("layout-top-nav");
  }
});


</script>

</body>
</html>
