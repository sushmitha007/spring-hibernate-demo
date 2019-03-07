package com.stackroute.muzixapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stackroute.muzixapp.model.Track;

@Repository
@Transactional
public class TrackDAOImpl implements TrackDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public TrackDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean saveTrack(Track track) {
		try {

			sessionFactory.getCurrentSession().save(track);
			return true;
		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteTrack(int id) {

		try {

			Track track = (Track) sessionFactory.getCurrentSession().load(Track.class, id);
			sessionFactory.getCurrentSession().delete(track);
			sessionFactory.getCurrentSession().flush();
			return true;

		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Track> getAllTracks() {
		System.out.println("Inside getAllTraacks");

		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Track");
		List<Track> allTracks=query.list();

		//List<Track> allTracks = sessionFactory.getCurrentSession().createQuery("from Track order by id desc").list();
		return allTracks;

	}

	@Override
	public Track getTrackById(int id) {
		Track track = sessionFactory.getCurrentSession().load(Track.class, id);
		Hibernate.initialize(track);
		return track;
	}

	@Override
	public boolean UpdateTrack(Track track) {

		sessionFactory.getCurrentSession().update(track);
		return true;
	}

}
