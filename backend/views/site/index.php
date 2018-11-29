<?php $this->title = '仪表盘 Dashboard'; ?>
<section class="content">
    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-area-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">CPU Traffic</span>
              <span class="info-box-number">90<small>%</small></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-bar-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Likes</span>
              <span class="info-box-number">41,410</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-line-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Sales</span>
              <span class="info-box-number">760</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-pie-chart"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">New Members</span>
              <span class="info-box-number">2,000</span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>

    <div class="row">
    <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">系统信息 System Info</h3>
            </div>
            <div class="box-body">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td>Yii版本</td>
                    <td><?php echo Yii::getVersion() ?></td>
                    <td>Composer扩展</td>
                    <td>
                      <a href="https://github.com/yiiplus/yii2-desktop" target="_blank">yiiplus/yii2-desktop</a>
                      <a href="https://github.com/yiiplus/yii2-fis-smarty" target="_blank">yiiplus/yii2-fis-smarty</a>
                    </td>
                  </tr>
                  <tr>
                    <td>服务器操作系统</td>
                    <td><?php echo php_uname('s') ?></td>
                    <td>WEB运行环境</td>
                    <td><?php echo php_sapi_name() ?></td>
                  </tr>
                  <tr>
                    <td>MySQL数据库版本</td>
                    <td><?php echo Yii::$app->db->pdo->getAttribute(\PDO::ATTR_SERVER_VERSION) ?></td>
                    <td>运行PHP版本</td>
                    <td><?php echo phpversion() ?></td>
                  </tr>
                  <tr>
                    <td>上传大小限制</td>
                    <td><?php echo ini_get('upload_max_filesize') ?></td>
                    <td>POST大小限制</td>
                    <td><?php echo ini_get('post_max_size') ?></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- /.box -->

          <div class="box box-danger">
            <div class="box-header">
              <h3 class="box-title">产品团队 Product Team</h3>
            </div>
            <div class="box-body">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <td>项目名称</td>
                    <td><?php echo Yii::$app->name ?></td>
                    <td>产品DEMO体验</td>
                    <td><a href="http://demo.yiiplus.com" target="_blank">http://demo.yiiplus.com</a></td>
                  </tr>
                  <tr>
                    <td>项目地址</td>
                    <td><a href="http://admin.yiiplus.com" target="_blank">http://admin.yiiplus.com</a></td>
                    <td>脚手架BUG反馈</td>
                    <td><a href="https://github.com/yiiplus/scaffold/issues" target="_blank">https://github.com/yiiplus/scaffold/issues</a></td>
                  </tr>
                  <tr>
                    <td>公司官网</td>
                    <td><a href="http://www.yiiplus.com" target="_blank">http://www.yiiplus.com</a></td>
                    <td>获取脚手架</td>
                    <td><a href="https://github.com/yiiplus/scaffold" target="_blank">https://github.com/yiiplus/scaffold</a></td>
                  </tr>
                  <!-- <tr>
                    <td>官方QQ群</td>
                    <td></td>
                    <td>官方微信群</td>
                    <td></td>
                  </tr> -->
                  <tr>
                    <td>团队成员</td>
                    <td colspan="3">陈红斌、耿贤坤</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
      </div>
    </div>
</section>