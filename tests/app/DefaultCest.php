<?php
namespace tests\app;

class DefaultCest extends CestBase
{
    /**
     * @before auth
     */
    public function indexTest(\ApiTester $I)
    {
        $I->wantTo('API列表');
        $I->haveHttpHeader('Content-Type', 'application/json');
        $I->sendGET('/');
        $I->seeResponseCodeIs(\Codeception\Util\HttpCode::OK);
        $I->seeResponseIsJson();
    }
}
