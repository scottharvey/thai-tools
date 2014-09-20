class TT.Numbers

  inThai: (number) ->
    number = parseInt(number).toString()
    if number < 10
      result = @thaiNumeral(number)
    else if number >= 10 and number < 100
      result = @thaiTens(number[0])
      if number[1] > 1
        result += @thaiNumeral(number[1])
      else if number[1] == '1'
        result += 'เอ็ด'
    else if number >= 100 and number < 1000
      result = @thaiHundreds(number[0])
      result = @thaiTens(number[1])
      if number[1] > 1
        result += @thaiNumeral(number[1])
      else if number[1] == '1'
        result += 'เอ็ด'
    result

  thaiNumeral: (number) =>
    { '0': 'ศูนย์', '1': 'หนึ่ง', '2': 'สอง', '3': 'สาม', '4': 'สี่', '5': 'ห้า', '6': 'หก', '7': 'เจ็ด', '8': 'แปด', '9': 'เก้า' }[number]

  thaiTens: (number) =>
    if number == '1'
      number = 'สิบ'
    else if number == '2'
      number = 'ยี่สิบ'
    else
      number = "#{@thaiNumeral(number)}สิบ"
    number

  thaiHundreds: (number) =>
    "#{@thaiNumeral(number)}ร้อย"
