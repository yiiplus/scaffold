<?php
namespace common\channels;

use common\models\LiveRoom;
use yii\base\BaseObject;
use yiiplus\websocket\ChannelInterface;

class ExitLiveRoomChannel extends BaseObject implements ChannelInterface
{
    public function execute($fd, $data) {
        return;
    }

    public function close($fd)
    {
        LiveRoom::deleteAll(['id' => $fd]);
    }
}
