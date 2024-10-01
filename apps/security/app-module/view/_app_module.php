<div class="card card-body">
    <div class="row">
        <div class="col-md-4 mt-3 mt-md-0">
            <div class="position-relative">
                <input type="text" class="form-control product-search ps-5" id="datatable-search" placeholder="Search..." />
                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
            </div>
        </div>
        <div class="col-md-2 mt-3 mt-md-0">
            <div class="position-relative">
                <select id="datatable-length" class="form-control">
                    <option value="-1">All</option>
                    <option value="5">5</option>
                    <option value="10" selected>10</option>
                    <option value="20">20</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
            </div>
        </div>
        <div class="col-md-6 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0">
            <div class="card-actions cursor-pointer ms-auto d-flex button-group">
                <?php
                    if ($deleteAccess['total'] > 0 || $exportAccess['total'] > 0) {
                        $action = '
                        <button type="button" class="btn btn-dark dropdown-toggle action-dropdown mb-0 d-none" 
                                data-bs-toggle="dropdown" aria-expanded="false">
                            Action
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">';
                    
                        if ($exportAccess['total'] > 0) {
                            $action .= '
                            <li><button class="dropdown-item" type="button" id="export-app-module">Export</button></li>';
                        }
                    
                        if ($deleteAccess['total'] > 0) {
                            $action .= '
                            <li><button class="dropdown-item" type="button" id="delete-app-module">Delete</button></li>';
                        }
                    
                        $action .= '</ul>';
                    
                        echo $action;
                    }

                    echo $importAccess['total'] > 0 ? '<a href="' . $pageLink . '&import='. $securityModel->encryptData('app_module') .'" class="btn btn-warning d-flex align-items-center mb-0">Import</a>' : '';
                    echo $createAccess['total'] > 0 ? '<a href="' . $pageLink . '&new" class="btn btn-success d-flex align-items-center mb-0">Create</a>' : '';
                ?>
            </div>
        </div>
    </div>
</div>

<div  class="datatables">
    <div class="row">
        <div class="col-12">
            <div class="card mb-0">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="app-module-table" class="table w-100 table-hover display text-nowrap dataTable">
                            <thead class="text-dark">
                                <tr>
                                    <th class="all">
                                        <div class="form-check">
                                            <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                                        </div>
                                    </th>
                                    <th>App Module</th>
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