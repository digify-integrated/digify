<div class="card mb-6">
    <div class="card-header border-0 pt-6">
        <div class="card-title">
            <div class="d-flex align-items-center position-relative my-1 me-3">
                <i class="ki-outline ki-magnifier fs-3 position-absolute ms-5"></i> <input type="text" class="form-control w-250px ps-12" id="datatable-search" placeholder="Search..." autocomplete="off" />
            </div>
            <select id="datatable-length" class="form-select w-auto">
                <option value="-1">All</option>
                <option value="5">5</option>
                <option value="10" selected>10</option>
                <option value="20">20</option>
                <option value="25">25</option>
                <option value="50">50</option>
                <option value="100">100</option>
            </select>
        </div>
        <div class="card-toolbar">
            <div class="d-flex justify-content-end" data-kt-customer-table-toolbar="base">
                <?php
                    if ($deleteAccess['total'] > 0 || $exportAccess['total'] > 0) {
                        $action = '<a href="#" class="btn btn-light-primary btn-flex btn-center btn-active-light-primary show menu-dropdown action-dropdown me-30d-none" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
                                        Actions
                                        <i class="ki-outline ki-down fs-5 ms-1"></i>
                                    </a>
                                    <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4" data-kt-menu="true" style="z-index: 107; position: fixed; inset: 0px 0px auto auto; margin: 0px; transform: translate(-60px, 539px);" data-popper-placement="bottom-end">';
                    
                        if ($exportAccess['total'] > 0) {
                            $action .= '<div class="menu-item px-3">
                                            <a href="javascript:void(0);" class="menu-link px-3" data-bs-toggle="modal" id="export-data" data-bs-target="#export-modal">
                                                Export
                                            </a>
                                        </div>';
                        }
                    
                        if ($deleteAccess['total'] > 0) {
                            $action .= '<div class="menu-item px-3">
                                            <a href="javascript:void(0);" class="menu-link px-3" id="delete-app-module">
                                                Delete
                                            </a>
                                        </div>';
                        }
                    
                        $action .= '</div>';
                    
                        echo $action;
                    }
                ?>
            </div>
        </div>
    </div>
    <div class="card-body pt-9">
        <div class="table-responsive">
            <table class="table align-middle cursor-pointer table-row-dashed fs-6 gy-5" id="app-module-table">
                <thead>
                    <tr class="text-start text-gray-800 fw-bold fs-7 text-uppercase gs-0">
                        <th>
                            <div class="form-check form-check-sm form-check-custom form-check-solid me-3">
                                <input class="form-check-input" id="datatable-checkbox" type="checkbox">
                            </div>
                        </th>
                        <th>App Module</th>
                    </tr>
                </thead>
                <tbody class="fw-semibold text-gray-800"></tbody>
            </table>
        </div>
    </div>
</div>

<?php
    $exportAccess['total'] > 0 ? require('./app/Views/Includes/export-modal.php') : '';
?>