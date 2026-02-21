<?php

namespace  Botble\Timeline\Database\Seeders;

use App\Models\User;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Supports\BaseSeeder;
use Botble\Block\Models\Block;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Models\TimelineCategory;
use Botble\Timeline\Models\TimelineItem;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\DateIdeas\Models\PlaceReview;
use Botble\Page\Database\Traits\HasPageSeeder;
use Illuminate\Support\Arr;

class TimelineSeeder extends BaseSeeder
{
    public function run(): void
    {
        TimelineItem::query()->delete();
        Timeline::query()->delete();
        TimelineCategory::query()->delete();

        $faker = $this->fake();
        // Seed Place Categories
        $categories = [
            /*'en' => [
                'First Meeting',
                'First Date',
                'Official',
                'Adventure',
                'Family',
                'Milestone',
                'Big Step',
                'Forever',
            ],
            'vi' => [*/
            'Lần đầu gặp gỡ',
            'Buổi hẹn đầu tiên',
            'Chính thức bên nhau',
            'Những chuyến phiêu lưu',
            'Gia đình và người thân',
            'Cột mốc đáng nhớ',
            'Bước ngoặt lớn',
            'Mãi mãi bên nhau',
            /*],*/
        ];


        foreach ($categories as $lang => $item) {
            $category = TimelineCategory::query()->create([
                'name' => $item,
            ]);
        }

        $timeline = Timeline::query()->create([
            'name' => 'Tuấn & Ngân',
            'description' => 'Hành trình của Tuấn & Ngân',
            'order' => 0,
            'status' => BaseStatusEnum::PUBLISHED,
        ]);

        $categoryIds = TimelineCategory::query()->pluck('id')->toArray();

        $timelineItems = [
            [
                'title' => 'Chúng tôi quen nhau',
                'description' => 'Chúng tôi đã gặp và quen nhau như thế nào?',
                'content' => 'Giữa những ngày dịch COVID-19 bùng phát, khi mọi người đều phải ở nhà, chúng tôi tình cờ quen nhau qua một tựa game trực tuyến mang tên Thiện Nữ – chỉ đơn giản với vai trò là sư phụ và đồ đệ. Thật không ngờ, trò chơi ấy lại xoá đi khoảng cách địa lý và giúp chúng tôi tìm thấy nhiều điểm chung, cùng nhau tạo nên những kỷ niệm đáng nhớ. Từ những lần trò chuyện vu vơ, chia sẻ niềm vui nho nhỏ đến những câu chuyện đời thường, chúng tôi dần hiểu và trân quý nhau hơn. Từ khoảnh khắc tình cờ ấy, một mối liên kết đặc biệt đã bắt đầu — và nó đã thay đổi cuộc sống của cả hai mãi mãi.',
            ],
            [
                'title' => 'Khoảng thời gian mất liên lạc',
                'description' => 'Khi cuộc sống trở lại bình thường, chúng tôi đã mất liên lạc với nhau.',
                'content' => 'Khi đại dịch dần lùi xa, những lệnh giãn cách được gỡ bỏ, mọi người trở lại với nhịp sống thường nhật của riêng mình. Chúng tôi cũng vậy — mỗi người lại cuốn vào cuộc sống, học tập và công việc. Cứ thế, liên lạc dần thưa thớt rồi mất hẳn. Nhưng dù không nói ra, đâu đó trong lòng vẫn còn một góc nhỏ dành cho người kia.',
            ],
            [
                'title' => 'Lần gặp lại định mệnh',
                'description' => 'Sau gần hai năm, mình tình cờ quay trở lại tựa game đầy kỷ niệm ấy — và thật bất ngờ, gặp lại em.',
                'content' => 'Một ngày, mình quay trở lại game xưa chỉ với chút hoài niệm, rồi bỗng thấy một cái tên quen thuộc hiện lên trên màn hình. Tim như khựng lại. Chúng mình lại trò chuyện, lại cười, và lần này, không chỉ trong game — chúng mình kết bạn ngoài đời, và liên lạc thường xuyên hơn. Giống như định mệnh sắp đặt để hai người từng lạc mất nhau lại được gặp lại.',
            ],
            [
                'title' => 'Biến cố đầu tiên',
                'description' => 'Chúng mình lại xa nhau thêm một lần nữa.',
                'content' => 'Khi ấy, em chuẩn bị lên Hà Nội để bắt đầu hành trình học tập mới. Còn mình thì đột nhiên nhận tin dữ — mẹ mắc bệnh nặng. Cả gia đình chìm trong nỗi lo, còn mình thì gần như sụp đổ. Mình thu mình lại, tránh xa mọi người, kể cả em. Một lần nữa, chúng mình im lặng, mỗi người lại đi về hai hướng khác nhau giữa những tổn thương và khoảng lặng khó nói thành lời.',
            ],
            [
                'title' => 'Trở lại',
                'description' => 'Chúng mình một lần nữa tìm thấy nhau.',
                'content' => 'Sau khi mọi thứ dần ổn định, mình học cách đối mặt và cân bằng lại cuộc sống. Trong một khoảnh khắc, mình nhắn tin cho em — không nghĩ rằng sẽ được hồi âm. Nhưng rồi, thật ấm lòng khi biết em vẫn nhớ đến mình, và giờ đã ở Hà Nội. Chúng mình lại bắt đầu nói chuyện, nhẹ nhàng như chưa từng có những ngày im lặng. Có lẽ, đôi khi chỉ cần một tin nhắn, mọi khoảng cách đều có thể được xóa nhòa.',
            ],
        ];

        foreach ($timelineItems as $item) {
            TimelineItem::query()->create([
                'title' => $item['title'],
                'description' => $item['description'],
                'content' => $item['content'],
                'status' => BaseStatusEnum::PUBLISHED,
                'timeline_id' => $timeline->id,
            ]);
        }

    }
}
