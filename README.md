# OC_Flutter

## iOS原生与Flutter页面交互--从如何集成到相互跳转与传值
[https://www.jianshu.com/p/abd937d0d9aa](https://www.jianshu.com/p/abd937d0d9aa)

## 混编后如何restart/reload&调试Flutter代码
[https://www.jianshu.com/p/1500366d7753](https://www.jianshu.com/p/1500366d7753)

# iOS旧项目导入Flutter

* 注意事项⚠️:将`Enable Bitcode`设置为`No`

1. 如果`flutter`分支不是`master`，需要进行以下几步，否则忽略该步骤。

	cd `flutter`文件夹，切换分支，更新。

例如: 

```
Last login: Wed May 13 10:30:42 on ttys000
☁  ~  which flutter
/Users/xxx/Software/code/flutter/bin/flutter
☁  ~  cd /Users/xxx/Software/code/flutter
☁  flutter [stable] flutter channel master
******省略******
☁  flutter [stable] git pull
```

2. cd iOS项目上级文件夹，新建一个文件夹，用于放置Flutter项目

```
flutter create -t module flutter_module
```

3. cd iOS项目内，修改`Podfile`

```
flutter_application_path = '../flutter_module/'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'OCFlutter' do
  use_frameworks!
  install_all_flutter_pods(flutter_application_path)

end
```

4. `pod install`即可。
