class TT.Numbers

  inThai: (number) ->
    number = number.toString()
    if number < 10
      @thaiNumeral(number)
    else if number >= 10 and number < 100
      "#{@thaiTens(number[0])}#{@thaiNumeral(number[1])}"

  thaiNumeral: (number) =>
    { '0': 'ศูนย์', '1': 'หนึ่ง', '2': 'สอง', '3': 'สาม', '4': 'สี่', '5': 'ห้า', '6': 'หก', '7': 'เจ็ด', '8': 'แปด', '9': 'เก้า' }[number]

  thaiTens: (number) =>
    if number == '1'
      number = 'สิบ'
    if number == '2'
      number = 'ยี่สิบ'
    else
      number = "#{@thaiNumeral(number)}สิบ"
    number
