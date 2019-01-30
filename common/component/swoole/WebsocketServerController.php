<?php
namespace common\component\swoole;

use yii\base\Component;
use yii\console\Controller;

class WebsocketServerController extends Controller
{
    public $host = '0.0.0.0';

    public $port = 9501;

    public $defaultAction = 'start';

	protected $server;

    public function options($actionID)
    {
        return [
            'host',
            'port'
        ];
    }

    public function optionAliases()
    {
        return [
            'h' => 'host',
            'p' => 'port',
        ];
    }

    public function actionStart()
    {
        $this->server = new \Swoole\WebSocket\Server($this->host, $this->port);

        $this->server->on('handshake', [$this, 'user_handshake']);

        $this->server->on('open', [$this, 'open']);

        $this->server->on('message', [$this, 'message']);

        $this->server->on('close', [$this, 'close']);

        echo 'websocket service has started, host is ' . $this->host . ' port is ' . $this->port . PHP_EOL;

        $this->server->start();
    }

    public function user_handshake(\swoole_http_request $request, \swoole_http_response $response)
    {
        $sec_websocket_key = $request->header['sec-websocket-key'] ?? null;

        //自定定握手规则，没有设置则用系统内置的（只支持version:13的）
        if (!isset($sec_websocket_key))
        {
            //'Bad protocol implementation: it is not RFC6455.'
            $response->end();
            return false;
        }
        if (0 === preg_match('#^[+/0-9A-Za-z]{21}[AQgw]==$#', $sec_websocket_key)
            || 16 !== strlen(base64_decode($sec_websocket_key))
        )
        {
            //Header Sec-WebSocket-Key is illegal;
            $response->end();
            return false;
        }

        $key = base64_encode(sha1($sec_websocket_key
            . '258EAFA5-E914-47DA-95CA-C5AB0DC85B11',
            true));
        $headers = array(
            'Upgrade'               => 'websocket',
            'Connection'            => 'Upgrade',
            'Sec-WebSocket-Accept'  => $key,
            'Sec-WebSocket-Version' => '13',
            'KeepAlive'             => 'off',
        );
        foreach ($headers as $key => $val)
        {
            $response->header($key, $val);
        }
        $response->status(101);
        $response->end();
        
        echo "server: handshake success with fd{$request->fd}\n";
        return true;
    }

    public function open(\swoole_websocket_server $server, $request) 
    {
        echo "server: handshake success with fd{$request->fd}\n";
    }

    public function message(\Swoole\WebSocket\Server $server, $frame) 
    {
        echo "received " . strlen($frame->data) . " bytes\n";
    }

    public function close($ser, $fd) 
    {
        echo "client {$fd} closed\n";
    }
}
