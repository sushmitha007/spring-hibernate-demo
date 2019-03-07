package com.stackroute.muzixapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stackroute.muzixapp.dao.TrackDAO;
import com.stackroute.muzixapp.model.Track;

import java.util.List;

@Controller
@RequestMapping("/")
public class TrackController {

	@Autowired
	private TrackDAO trackDao;

	private Track track = new Track();

	@GetMapping
	public String indexPage(ModelMap model) {
		List<Track> tracks= trackDao.getAllTracks();
		System.out.println("Track Lists"+tracks);
		model.addAttribute("tracks", tracks);
		return "index";
	}

	@PostMapping("add")
	public String addTrack(HttpServletRequest request, HttpServletResponse respose, ModelMap model) {
		if (request.getParameter("name").isEmpty() || request.getParameter("comment").isEmpty()) {
			model.addAttribute("message", "Track fields cannot be empty");
			return "index";
		}

		else {
			track.setName(request.getParameter("name"));
			track.setComment(request.getParameter("comment"));
			boolean status = trackDao.saveTrack(track);
			if (status) {
				model.addAttribute("tracks", trackDao.getAllTracks());
				return "redirect:/";
			} else {
				return "index";
			}

		}

	}

	@DeleteMapping("delete")
	public String deleteTrack(@RequestParam String id) {
		trackDao.deleteTrack(Integer.parseInt(id));
		return "redirect:/";

	}

	@PostMapping("update")
	public String updateTrack(HttpServletRequest request, HttpServletResponse response) {
		Track updateTrack = new Track();
		updateTrack.setId(Integer.parseInt(request.getParameter("id")));
		updateTrack.setName(request.getParameter("trackTitle"));
		updateTrack.setComment(request.getParameter("trackContent"));
		trackDao.UpdateTrack(updateTrack);
		return "redirect:/";
	}

}