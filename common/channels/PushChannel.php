<?php
namespace common\channels;

use common\models\LiveRoom;
use yii\base\BaseObject;
use yiiplus\websocket\ChannelInterface;

class PushChannel extends BaseObject implements ChannelInterface
{
    public function execute($fd, $data)
    {
        $liveRoomIds = LiveRoom::find()->where(['room_id' => $data->room_id])->column('id');

        return [
            $liveRoomIds,
            $data->message
        ];
    }

    public function close($fd)
    {
        return;
    }
}