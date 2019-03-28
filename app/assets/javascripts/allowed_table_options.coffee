$(document).on 'turbolinks:load', ->
  rolesDataTable = $('#rolesTable').DataTable 'pagingType': 'simple', 'stateSave': true, 'columnDefs': [{'targets': 1, 'orderable': false, 'searchable': false}]
  document.addEventListener 'turbolinks:before-cache', ->
    if rolesDataTable != null
      rolesDataTable.destroy()
      rolesDataTable = null
    return

  trackCategoriesDataTable = $('#trackCategoriesTable').DataTable 'pagingType': 'simple', 'stateSave': true, 'columnDefs': [{'targets': 2, 'orderable': false, 'searchable': false}]
  document.addEventListener 'turbolinks:before-cache', ->
    if trackCategoriesDataTable != null
      trackCategoriesDataTable.destroy()
      trackCategoriesDataTable = null
    return

  tracksDataTable = $('#tracksTable').DataTable 'pagingType': 'simple', 'stateSave': true, 'columnDefs': [{'targets': 3, 'orderable': false, 'searchable': false}]
  document.addEventListener 'turbolinks:before-cache', ->
    if tracksDataTable != null
      tracksDataTable.destroy()
      tracksDataTable = null
    return

  levelsDataTable = $('#levelsTable').DataTable 'pagingType': 'simple', 'stateSave': true, 'columnDefs': [{'targets': 5, 'orderable': false, 'searchable': false}]
  document.addEventListener 'turbolinks:before-cache', ->
    if levelsDataTable != null
      levelsDataTable.destroy()
      levelsDataTable = null
    return

  uploadsDataTable = $('#uploadsTable').DataTable 'pagingType': 'simple', 'stateSave': true, 'columnDefs': [{'targets': 4, 'orderable': false, 'searchable': false}]
  document.addEventListener 'turbolinks:before-cache', ->
    if uploadsDataTable != null
      uploadsDataTable.destroy()
      uploadsDataTable = null
    return
  $('.dataTables_length').addClass 'bs-select'
  return