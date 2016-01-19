



# HWSimpleToast

- Swift 2.1
- Very Simple, Very Light 
- HWSimpleToast uses two views only (Background View, Message Label)

### Simple Example

```
HWSimpleToast(message: "Your Message").show()
```

### Position Setting
```
HWSimpleToast(message: "Your Message").setPosition(.Bottom).show()

```
#### HWSimpleToastPosition (Enum)
- .Top
- .Center
- .Bottom

### TextColor, BackgroundColor
```
HWSimpleToast(message: "Your Message").setBackgroundColor(UIColor.redColor()).setTextColor(UIColor.whiteColor()).show()
```

## Settings are preserved.
Set configuration once and just call show() method each time.

## License

`HWViewPager` is available under the MIT license. See the LICENSE file for more info.





# HWSimpleToast


*  스위프트로 만든 토스트 좋은것들이 이미 많지만, 저는 진짜 간단하고 가벼운걸 선호해서 하나 만들어봤습니다.
*  백그라운드 뷰랑, UILabel 딸랑 두개만 썼기 때문에 엄청가볍습니다.
*  TextColor 나 BackgroundColor, Position 등은 한번만 호출해두면, 그 뒤에도 계속해서 적용이됩니다.
*  예를들어, `HWSimpleToast(message :"메세지").setPosition(.Bottom).show()` 이렇게 한번 호출했으면, 그 다음부터는 `HWSimpleToast(message :"메세지").show()` 이렇게만 호출해줘도 계속 쭈욱~ Bottom Position을 유지합니다. 

 




#Example



<img src="http://blogfiles.naver.net/20160111_273/vowed_1452500488335xFx0K_JPEG/HWToast.jpg">


