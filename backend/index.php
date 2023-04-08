<?php

require_once "vendor/autoload.php";

use Tqdev\PhpCrudApi\Api;
use Tqdev\PhpCrudApi\Config\Config;
use Tqdev\PhpCrudApi\RequestFactory;
use Tqdev\PhpCrudApi\ResponseUtils;

$config = new Config([
  'driver' => 'sqlite',
  // 'username' => '[db user name]',
  // 'password' => '[db password]',
  // 'database' => '[db scheme name]',
  'address'  => '../db/db.sqlite3',
  // 'middlewares' => 'dbAuth,authorization',
  'controllers' => 'records,openapi',
  // 'dbAuth.usersTable' => 'Users',
  // 'dbAuth.registerUser' => 1
]);
$request = RequestFactory::fromGlobals();
$api = new Api($config);
$response = $api->handle($request);
ResponseUtils::output($response);