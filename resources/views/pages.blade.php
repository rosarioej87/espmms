<?php $page = TCG\Voyager\Models\Page::first(); ?>

@can('browse', $page)
    <p>You can browse pages</p>
@endcan



@can('edit', $page)
    <p>You can edit pages</p>

    @else
    <p>You don't have access to edit pages</p>
@endcan
