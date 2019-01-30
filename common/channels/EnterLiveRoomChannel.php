<?php
namespace common\channels;

use Yii;
use common\models\LiveRoom;
use yii\base\BaseObject;
use yiiplus\websocket\ChannelInterface;

class EnterLiveRoomChannel extends BaseObject implements ChannelInterface
{
    public function execute($fd, $data)
    {
        $liveRoomModel = new LiveRoom();

        $liveRoomModel->id = $fd;
        $liveRoomModel->room_id = $data->room_id;
        $liveRoomModel->uid = $data->uid;

        $liveRoomModel->save();
    }

    public function close($fd)
    {
        return;
    }
}
