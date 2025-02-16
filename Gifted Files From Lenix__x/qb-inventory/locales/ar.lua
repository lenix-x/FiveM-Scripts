local Translations = {
    progress = {
        ['snowballs'] = 'جمع كرات الثلج..',
    },
    notify = {
        ['failed'] = 'فشل',
        ['canceled'] = 'تم الإلغاء',
        ['vlocked'] = 'تم قفل المركبة',
        ['notowned'] = 'أنت لا تمتلك هذا العنصر!',
        ['missitem'] = 'ليس لديك هذا العنصر!',
        ['nonb'] = 'لا يوجد أحد بالقرب!',
        ['noaccess'] = 'غير قابل للوصول',
        ['nosell'] = 'لا يمكنك بيع هذا العنصر..',
        ['itemexist'] = 'العنصر غير موجود',
        ['notencash'] = 'ليس لديك ما يكفي من المال..',
        ['noitem'] = 'ليس لديك العناصر الصحيحة..',
        ['gsitem'] = 'لا يمكنك إعطاء نفسك عنصر؟',
        ['tftgitem'] = 'أنت بعيد جدًا لإعطاء العناصر!',
        ['infound'] = 'العنصر الذي حاولت إعطائه غير موجود!',
        ['iifound'] = 'تم العثور على عنصر غير صحيح، حاول مرة أخرى!',
        ['gitemrec'] = 'لقد تلقيت ',
        ['gitemfrom'] = ' من ',
        ['gitemyg'] = 'لقد أعطيت ',
        ['gitinvfull'] = 'مخزون اللاعب الآخر ممتلئ!',
        ['giymif'] = 'مخزونك ممتلئ!',
        ['gitydhei'] = 'ليس لديك ما يكفي من هذا العنصر',
        ['gitydhitt'] = 'ليس لديك عناصر كافية لنقلها',
        ['navt'] = 'نوع غير صالح..',
        ['anfoc'] = 'لم يتم ملء المعاملات بشكل صحيح..',
        ['yhg'] = 'لقد أعطيت ',
        ['cgitem'] = 'لا يمكن إعطاء العنصر!',
        ['idne'] = 'العنصر غير موجود',
        ['pdne'] = 'اللاعب غير متصل',
    },
    inf_mapping = {
        ['opn_inv'] = 'فتح المخزون',
        ['tog_slots'] = 'تبديل فتحات المفاتيح',
        ['use_item'] = 'استخدام العنصر في الفتحة ',
    },
    menu = {
        ['vending'] = 'آلة البيع',
        ['bin'] = 'فتح سلة المهملات',
        ['craft'] = 'صناعة',
        ['o_bag'] = 'فتح الحقيبة',
    },
    interaction = {
        ['craft'] = '~g~E~w~ - صناعة',
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
