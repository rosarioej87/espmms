<style>
    .navbar .nav-item .dropdown-menu{ display: none; }
    .navbar .nav-item:hover .nav-link{   }
    .navbar .nav-item:hover .dropdown-menu{ display: block; }
    .navbar .nav-item .dropdown-menu{ margin-top:0; }
</style>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNav">
{{--            <ul class="navbar-nav">--}}

{{--                @foreach($items as $menu_item)--}}
{{--                    <li class="nav-item">--}}
{{--                        <a class="nav-link" href="{{ $menu_item->link() }}">{{ $menu_item->title }}</a>--}}
{{--                        @if(!$menu_item->children->isEmpty())--}}
{{--                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">--}}
{{--                                @include('voyager::menu.default', ['items' => $menu_item->children, 'options' => $options])--}}
{{--                            </ul>--}}
{{--                        @endif--}}
{{--                    </li>--}}
{{--                @endforeach--}}

{{--            </ul>--}}
            <ul class="navbar-nav">

                @foreach ($items as $item)

                    <li class="nav-item">
                        <a class="nav-link" href="{{ url($item->link()) }}" target="{{ $item->target }}">
                            <span>{{ $item->title }}</span>
                        </a>
                        @if(!$item->children->isEmpty())
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                @include('my_menu', ['items' => $item->children, 'options' => $options])
                            </ul>
                        @endif
                    </li>
                @endforeach

            </ul>

        </div>
    </div>
</nav>


