class TT.Numbers

  translate: (number) ->
    number = number.toString()
    parts = number.split('').reverse()
    result = ""
    for part, index in parts
      if index == 0
        result = @thaiNumeral part

      # Tens
      else if index == 1
        if parts[0] == '1'
          result = 'เอ็ด'
        else if parts[0] == '0'
          result = ''
        result = @thaiTens(part) + result if part != '0'

      # Hundreds
      else if index == 2
        result = "#{@thaiNumeral(part)}ร้อย" + result if part != '0'

      # Thousands
      else if index == 3
        result = "#{@thaiNumeral(part)}พัน" + result if part != '0'

      # Ten Thousands
      else if index == 4
        result = "#{@thaiNumeral(part)}หมื่น" + result if part != '0'

      # Hundred Thousands
      else if index == 5
        result = "#{@thaiNumeral(part)}แสน" + result if part != '0'

      # Millions
      else if index == 6
        result = "#{@thaiNumeral(part)}ล้าน" + result if part != '0'

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
