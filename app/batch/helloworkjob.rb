class Helloworkjob
  def self.hellowork_urls
    agent = Mechanize.new
    agent.log = Logger.new('hello.log', 7)    
    links = []
        agent.request_headers = {
            "Host" => "www.hellowork.go.jp",
            "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:34.0) Gecko/20100101 Firefox/34.0",
            'Accept' => "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            'accept-language' => 'ja, ja-JP, en',
            'accept-encoding' => 'gzip, deflate',
            "Referer" => "https://www.hellowork.go.jp/servicef/130020.do?action=initDisp&screenId=130020",
            "Cookie" => "JSESSIONID=COQ6CP1L61J6AD9GC9HJIPHJ60OM4P1M64RMCD1N71H643UL9UNL208001B00000.OCP_APPLICATION_011",
            "url" => "kyushokuNumber1=&kyushokuNumber2=&kyushokuUmu=2&kyujinShurui=1&gekkyuKagen=&teate=1&kiboShokushu=&todofuken1=&chiku1=&todofuken2=&chiku2=&todofuken3=&chiku3=&todofuken4=&chiku4=&todofuken5=&chiku5=&nenrei=&shinchakuKyujin=1&kiboSangyo=H&commonSearch=%E6%A4%9C%E7%B4%A2&screenId=130020&action=&codeAssistType=&codeAssistKind=&codeAssistCode=&codeAssistItemCode=&codeAssistItemName=&codeAssistDivide=&xab_vrbs=commonNextScreen%2CcommonSearch%2CdetailSearchButton%2CcommonDelete"
          }
    baseurl = "https://www.hellowork.go.jp/servicef/130050.do?"
    @paramurl = "fwListNaviBtn1=1&fwListNowPage=1&fwListLeftPage=1"
    pageurl = "&fwListNaviCount=11&kyushokuUmuHidden=2&kyujinShuruiHidden=1&teateHidden=1&shinchakuKyujinHidden=1&kiboSangyoHidden=H&screenId=130050&action=&codeAssistType=&codeAssistKind=&codeAssistCode=&codeAssistItemCode=&codeAssistItemName=&codeAssistDivide=&xab_vrbs=detailJokenDispButton%2CcommonNextScreen%2CdetailJokenChangeButton%2CcommonDetailInfo"
#   pageurl ="&fwListNaviCount=11&kyushokuUmuHidden=2&kyujinShuruiHidden=1&teateHidden=1&kiboSangyoHidden=H&screenId=130050&action=&codeAssistType=&codeAssistKind=&codeAssistCode=&codeAssistItemCode=&codeAssistItemName=&codeAssistDivide=&xab_vrbs=detailJokenDispButton%2CcommonNextScreen%2CdetailJokenChangeButton%2CcommonDetailInfo"
    current_page = agent.post("#{baseurl}#{@paramurl}#{pageurl}")
    ttl = current_page.search('//div[@class="number-link-top"]/p[@class="txt90-right"]').first.text.to_s.split(/[[:space:]]/)
    pagenum = ttl[1].to_i / 20
    @page = 15
    while @page <= pagenum + 1
          if   @page >= 11 
              if @page.to_i % 10 == 1#正規表現で１桁目が１の場合となるかどうか。
                    if @page == 11
                       @q="?"
                       @page2 = @page  / 10
                       @page2 = @page2.round
                      # @page2 = @page2 
                       @page1 = @page 
                       current_page = agent.post("#{baseurl}fwListNaviBtn#{@page1}=#{@page}#{@q}&fwListNowPage=3&fwListLeftPage=#{@page2}#{pageurl}")  
                   else
                       @q="?"
                       @page2 = (@page - 2) / 10
                      # @page2 = @page2.floor
                       @page2 = @page2 * 10
                       @page1 = @page - @page2 + 1
                       current_page = agent.post("#{baseurl}fwListNaviBtn#{@page1}=#{@page}#{@q}&fwListNowPage=3&fwListLeftPage=#{@page2}#{pageurl}")  
                    end
              else 
                   @q=""
                   @page2 = (@page - 2) / 10
                  # @page2 = @page2.floor
                   @page2 = @page2 * 10
                   @page1 = @page - @page2 + 1
                   current_page = agent.post("#{baseurl}fwListNaviBtn#{@page1}=#{@page}#{@q}&fwListNowPage=3&fwListLeftPage=#{@page2}#{pageurl}")   
              end
          else
               @page = @page.to_s
               current_page = agent.post("#{baseurl}fwListNaviBtn#{@page}=3&fwListNowPage=3&fwListLeftPage=1#{pageurl}")
          end
      elements  = current_page.search('//div[@class="d-sole"]/table/tr/td/a[@id="ID_link"]')
      elements.each do |ele|
        links << ele[:href]
      end
      @page = @page.to_i
      @page += 1
    end
    links.each_with_index do |link,i|
 #    puts "#{i+1}"
      uri = link.to_s.gsub("./","")
      get_product("https://www.hellowork.go.jp/servicef/" + uri)
#      sleep 3 # second
    end
  end



    def self.get_product(link)
    tds = Array.new    
    re = /事業所名/   
    agent = Mechanize.new
    page = agent.get(link)


#もし、事業所名がなかったら、Skip
    page.search('th').each { |th|
        if th.inner_text =~ re then
            # 見つかった！

    #一つずれたら崩れる。多分なかったら落ちる。要設計。
        tds = page.search('table[@class="dynamic"]').search('tr').search('td').collect{ |n| n.inner_text.strip}
        ths = page.search('table[@class="dynamic"]').search('tr').search('th').collect{ |n| n.inner_text.strip}        
#        puts tds
##        CSV.open('sample2.csv','a') do |out|
##        puts tds.class
##           tds.each do | item |
##                out << item
##            end
##        end

  #     puts "-----"

             num = tds.count
             @hwk = []
             if num == 42               
                 (0..44).each do |i|
                      if i >= 0 and i <=25
                         @hwk[i] = tds[i]
                      elsif i >= 26 and i <= 38
                         @hwk[i+1] = tds[i]
                      elsif i >= 39
                         @hwk[i+3] = tds[i]
                      else
                         @hwk[i] = nil
                      end
                  end
             elsif num == 43               
                 (0..44).each do |i|
                      if i >= 0 and i <=25
                          @hwk[i] = tds[i]
                      elsif i >= 26 and i <= 38
                         @hwk[i+1] = tds[i]
                      elsif i >= 39
                         if i == 39
                             if ths[39] =~ /求人条件にかかる特記事項/
                              @hwk[i+1] = tds[i]    
                             elsif ths[39] =~ /備考/
                              @hwk[i+2] = tds[i] 
                             end
                         else   
                            @hwk[i+2] = tds[i]
                         end
                      else
                         @hwk[i] = nil
                      end
                  end              
             elsif num == 44
                 (0..44).each do |i|
                      if i >= 0 and i <=25
                          @hwk[i] = tds[i]
                      elsif i >= 26 and i <= 44
                         @hwk[i+1] = tds[i]
                      else
                         @hwk[i] = nil
                      end
                  end  
             elsif num == 45
               (0..44).each do |i|
                     @hwk[i] = tds[i]
               end       
             else
                 puts "Alert tds are #{num}!!"
             end
             
#ここからDBに格納する。その前にここである程度Trim しておく必要あり。
             puts @hwk[0]

 
            # (0..44).each do |i|のend
        @hwk = Hellowork.where(:hwnum => @hwk[0], :hwtype => @hwk[1], :hwjigyousyo => @hwk[2], :hwjigyousyoaddress	=> @hwk[3],
                                :hwjigyousyotel	=> @hwk[4],
                                :hwjigyousyofax	=> @hwk[5],
                                :hwjigyounaiyou => @hwk[6],
                                :hwsyokusyu	=> @hwk[7],
                                :hwkoyoukeitai => @hwk[8],
                                :hwsangyo => @hwk[9],
                                :hwsyugyoukeitai  => @hwk[10],
                                :hwkoyoukikan => @hwk[11],
                                :hwnennrei => @hwk[12],
                                :hwnennreiriyuu => @hwk[13],
                                :hwsyugyoujikan => @hwk[14],
                                :hwkyukeijikan => @hwk[15],
                                :hwjikangai => @hwk[16],
                                :hwroudounissuu => @hwk[17],
                                :hwsalarytype => @hwk[18],
                                :hwbonus => @hwk[19],
                                :hwkyujitsu => @hwk[20],
                                :hwsyukyu => @hwk[21],
                                :hwnenkankyujitsu	 => @hwk[22],
                                :hwikukyu => @hwk[23],
                                :hwtakuji => @hwk[24],
                                :hwworkplace => @hwk[25],
                                :hwensen => @hwk[26],
                                :hwtenkin => @hwk[27],
                                :hwjyugyouin => @hwk[28],
                                :hwhoken => @hwk[29],
                                :hwteinen => @hwk[30],
                                :hwsaikoyou => @hwk[31],
                                :hwjyutaku => @hwk[32],
                                :hwmycar => @hwk[33],
                                :hwtsukin => @hwk[34],
                                :hwsaiyoninzu => @hwk[35],
                                :hwshigotonaiyou => @hwk[36],
                                :hwgakureki	 => @hwk[37],
                                :hwkeiken => @hwk[38],
                                :hwmenkyo => @hwk[39],
                                :hwtokki => @hwk[40],
                                :hwbikou => @hwk[41],
                                :hwjyuribi => @hwk[42],
                                :hwkigenbi => @hwk[43],
                                :hwjyurianteijo => @hwk[44]).first_or_initialize
        @hwk.save
        end
 
  #if th.inner_text =~ re thenのend      
#    puts image_url
#    @product = Product.where(:title => title, :image_url => image_url).first_or_initialize
#    product.save
#@hwk = Hwjob.where(:hwid => @hwk[0], :jigyousyoname => @hwk[2], :tel => @hwk[4], :fax => @hwk[5], :regisdate => @hwk[42]).first_or_initialize 
#@hwk.save




}
# page.search('th').each { |th|ここのend
    end
end

Helloworkjob.hellowork_urls