<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
    <div class=" dropdown-header noti-title">
        <h6 class="text-overflow m-0">Bienvenidos</h6>
    </div>
    
   
    <a href="/miscitas" class="dropdown-item">
        <i class="ni ni-calendar-grid-58"></i>
        <span>Mis citas</span>
    </a>
    <a href="https://www.calameo.com/read/0073946390c2247110973" class="dropdown-item">
        <i class="ni ni-support-16"></i>
        <span>Ayuda</span>
    </a>
    
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('formLogout').submit();">
        <i class="ni ni-user-run"></i>
        <span>Cerrar sesión</span>
        <form action="{{ route('logout') }}" method="POST" style="display: none;" id="formLogout">
             @csrf
         </form>
    </a>
</div>
