<?php
namespace App\Controllers;

session_start();

require_once '../../config/config.php';
require_once '../../autoload.php';

use App\Models\Authentication;
use App\Models\SecuritySetting;
use App\Models\AppModule;
use App\Models\MenuItem;
use App\Core\Security;
use App\Helpers\SystemHelper;

use DateTime;

$controller = new AuthenticationController(
    new Authentication(),
    new SecuritySetting(),
    new AppModule(),
    new MenuItem(),
    new Security(),
    new SystemHelper()
);

$controller->handleRequest();

class AuthenticationController{
    protected $authentication;
    protected $securitySetting;
    protected $appModule;
    protected $menuItem;
    protected $security;
    protected $systemHelper;

    public function __construct(
        Authentication $authentication,
        SecuritySetting $securitySetting,
        AppModule $appModule,
        MenuItem $menuItem,        
        Security $security,
        SystemHelper $systemHelper
    ) {
        $this->authentication = $authentication;
        $this->securitySetting = $securitySetting;
        $this->appModule = $appModule;
        $this->menuItem = $menuItem;
        $this->security = $security;
        $this->systemHelper = $systemHelper;
    }

    public function handleRequest(){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $transaction = filter_input(INPUT_POST, 'transaction', FILTER_SANITIZE_STRING);

            switch ($transaction) {
                case 'build app module stack':
                    $this->buildAppModuleStack();
                    break;
                default:
                    $this->systemHelper->sendErrorResponse('Transaction Failed', 'We encountered an issue while processing your request.');
                    break;
            }
        }
    }

    # -------------------------------------------------------------
    #   Authenticate Function
    # -------------------------------------------------------------

    public function buildAppModuleStack(){
        $userAccountID = $_SESSION['user_account_id'];
        $apps = '';

        $list = $this->menuItem->buildAppModuleStack($userAccountID);

        foreach ($list as $row) {
            $appModuleID = $row['app_module_id'];
            $appModuleName = $row['app_module_name'];
            $appModuleDescription = $row['app_module_description'];
            $menuItemID = $row['menu_item_id'];
            $appLogo = $row['app_logo'];

            $menuItemDetails = $this->menuItem->getMenuItem($menuItemID);
            $menuItemURL = $menuItemDetails['menu_item_url'] ?? null;
                
            $apps .= ' <div class="col-lg-2" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="'. $appModuleDescription .'">
                            <a class="card d-flex justify-content-between flex-column flex-center w-100 text-gray-800 p-10 text-center" href="'. $menuItemURL .'?app_module_id='. $this->security->encryptData($appModuleID) .'&page_id='. $this->security->encryptData($menuItemID) .'">
                                <img src="'. $appLogo .'" alt="app-logo" class="img-fluid position-relative mb-5" width="75" height="75">
                                <span class="fs-2 fw-bold">'. $appModuleName .'</span>
                            </a>
                        </div>';
        }

        $this->systemHelper->sendSuccessResponse('', '',  ['appList' => $apps]);
    }

    # -------------------------------------------------------------

}

?>