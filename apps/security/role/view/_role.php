<div class="card card-body">
    <div class="row">
        <?php require_once('components/view/_datatable_search.php'); ?>
        <div class="col-md-6 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0">
            <div class="card-actions cursor-pointer ms-auto d-flex button-group">
                <?php
                    if ($deleteAccess['total'] > 0 || $exportAccess['total'] > 0) {
                        $action = '
                        <button type="button" class="btn btn-dark dropdown-toggle action-dropdown mb-0 d-none" 
                                data-bs-toggle="dropdown" aria-expanded="false">
                            Actions
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">';
                    
                        if ($exportAccess['total'] > 0) {
                            $action .= '
                            <li><button class="dropdown-item" type="button" data-bs-toggle="modal" id="export-data" data-bs-target="#export-modal">Export</button></li>';
                        }
                    
                        if ($deleteAccess['total'] > 0) {
                            $action .= '
                            <li><button class="dropdown-item" type="button" id="delete-role">Delete</button></li>';
                        }
                    
                        $action .= '</ul>';
                    
                        echo $action;
                    }

                    echo $importAccess['total'] > 0 ? '<a href="' . $pageLink . '&import='. $securityModel->encryptData('role') .'" class="btn btn-secondary d-flex align-items-center mb-0"><i class="ti ti-download fs-4 me-1"></i>Import</a>' : '';
                    echo $createAccess['total'] > 0 ? '<a href="' . $pageLink . '&new" class="btn btn-success d-flex align-items-center mb-0"><i class="ti ti-plus fs-4 me-1"></i>New</a>' : '';
                ?>
            </div>
        </div>
    </div>
</div>

<div class="datatables">
    <div class="row">
        <div class="col-12">
            <div class="card mb-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="role-table" class="table w-100 table-hover display text-nowrap dataTable">
                            <thead class="text-dark">
                                <tr>
                                    <th class="all">
                                        <div class="form-check">
                                            <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                                        </div>
                                    </th>
                                    <th>Role</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
    $exportAccess['total'] > 0 ? require('./components/view/_export_modal.php') : '';
?>