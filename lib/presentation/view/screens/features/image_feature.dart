import 'package:arti_genius/controllers/image_controller.dart';
import 'package:arti_genius/helper/global_constant.dart';
import 'package:arti_genius/presentation/presentation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ImageGenerationFeature extends StatefulWidget {
  const ImageGenerationFeature({super.key});

  @override
  State<ImageGenerationFeature> createState() => _ImageGenerationFeatureState();
}

class _ImageGenerationFeatureState extends State<ImageGenerationFeature> {
  final _controller = ImageController();
  @override
  Widget build(BuildContext context) {
    //initializing device size
    mq = MediaQuery.sizeOf(context);

    // initializing text theme
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generation'),
      ),
      //body
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .1,
          left: mq.width * .04,
          right: mq.width * .04,
        ),
        children: [
          //textfield
          TextFormField(
            controller: _controller.imageC,
            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText:
                  'Imagine Something wonderful &\nType here & I will create it for you..',
              hintStyle: textTheme.bodyLarge?.copyWith(
                  fontFamily: GoogleFonts.robotoMono().fontFamily,
                  color: blackColorLight),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
//ai image
          Container(
            height: mq.height * .5,
            alignment: Alignment.center,
            child: Obx(
              () => _aiImage(),
            ),
          ),

          //btn
          CustomButton(
              onTap: () {
                _controller.createAIImage();
              },
              text: 'Create'),
        ],
      ),
      //download btn
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 6, bottom: 6),
        child: FloatingActionButton(
          backgroundColor: blueColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          onPressed: () {},
          child: const Icon(
            Icons.save_alt_rounded,
            color: whiteColor,
            size: 26,
          ),
        ),
      ),
    );
  }

  Widget _aiImage() => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: switch (_controller.status.value) {
          Status.none => Lottie.asset(
              'assets/lottie/ai_play.json',
              width: mq.width * .6,
              height: mq.height * .6,
            ),
          Status.complete => CachedNetworkImage(
              imageUrl: _controller.url,
              placeholder: (context, url) => const CustomLoading(),
              errorWidget: (context, url, error) => const SizedBox()),
          Status.loading => const CustomLoading()
        },
      );
}