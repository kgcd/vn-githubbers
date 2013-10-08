module Utils
    def vietnamese_name? name
      name.downcase.match /
        nguyen|
        tran|
        pham|
        huynh|
        hoang|
        phan|
        quan|
        duong|
        vn|
        tuan|
        huy|
        thanh|
        linh|
        tuan|
        khanh|
        thien|
        hieu|
        xuan|
        binh|
        duy|
        giang|
        nhung|
        ngoc|
        thuy|
        ngan|
        hang|
        uyen|
        yen/x != nil
    end
end
